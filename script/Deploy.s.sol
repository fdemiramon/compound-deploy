// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.s.sol";
import {console} from "forge-std/Script.sol";
import {PriceOracleScript} from "./1-PriceOracle.s.sol";
import {StubScript} from "./2-Stub.s.sol";
import {IRMsScript} from "./3-IRMs.s.sol";
import {TokensScript} from "./4-Tokens.s.sol";
import {CTokensScript} from "./5-CTokens.s.sol";
import {EIP20Interface} from "../src/EIP20Interface.sol";
import {CTokenInterface} from "../src/CTokenInterfaces.sol";

contract Deploy is BaseScript {
    function run() public {
        (new PriceOracleScript()).run();
        (new StubScript()).run();
        (new IRMsScript()).run();
        (new TokensScript()).run();
        (new CTokensScript()).run();

        string[] memory tokenKeys = getTopKeys("Tokens");
        EIP20Interface token;
        CTokenInterface cToken;
        string memory output;
        string memory cTokenKey;
        for (uint256 i = 0; i < tokenKeys.length; i++) {
            token = EIP20Interface(getAddress("Tokens", tokenKeys[i]));
            vm.serializeAddress(tokenKeys[i], "address", address(token));
            vm.serializeString(tokenKeys[i], "name", token.name());
            vm.serializeString(tokenKeys[i], "symbol", token.symbol());
            output = vm.serializeInt(tokenKeys[i], "decimals", int256(int8(token.decimals())));
            output = vm.serializeString("tokens", tokenKeys[i], output);

            cToken = CTokenInterface(getAddress("CTokensDelegates", tokenKeys[i]));
            cTokenKey = string(abi.encodePacked("c", tokenKeys[i]));
            vm.serializeAddress(cTokenKey, "address", address(cToken));
            vm.serializeString(cTokenKey, "name", cTokenKey);
            vm.serializeString(cTokenKey, "symbol", cTokenKey);
            vm.serializeAddress(cTokenKey, "underlying", address(token));
            output = vm.serializeInt(cTokenKey, "decimals", int256(int8(token.decimals())));

            output = vm.serializeString("tokens", cTokenKey, output);
        }
        vm.serializeString("main", "Tokens", output);
        vm.serializeAddress("main", "Unitroller", getAddress("Stub", "Unitroller"));
        output = vm.serializeAddress("main", "Comptroller", getAddress("Stub", "Comptroller"));

        //output = string(abi.encodePacked('{"Tokens":', output, "}"));
        vm.writeJson(output, filePath(""));
    }

    function getTopKeys(string memory topKey) public returns (string[] memory) {
        string memory jsonContent = readFile(topKey);
        return vm.parseJsonKeys(jsonContent, "$");
    }
}
