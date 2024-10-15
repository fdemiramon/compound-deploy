// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {EIP20Interface as IERC20} from "../src/EIP20Interface.sol";
import {BaseScript} from "./BaseScript.s.sol";
import {CTokenInterface} from "../src/CTokenInterfaces.sol";
import {CErc20 as CToken} from "../src/CErc20.sol";
import {CErc20Delegator as CTokenDelegator} from "../src/CErc20Delegator.sol";
import {CErc20Delegate as CTokenDelegate} from "../src/CErc20Delegate.sol";
import {ComptrollerInterface} from "../src/ComptrollerInterface.sol";
import {InterestRateModel} from "../src/InterestRateModel.sol";
import {Script, console} from "forge-std/Script.sol";

contract CTokensScript is BaseScript {
    function run() public {
        // @dev Transiant variables
        ComptrollerInterface unitroller;
        IERC20 token;
        CTokenDelegate cTokenDelegate;
        address tokenAddress;
        CTokenDelegator cTokenDelegator;

        // @dev Get Unitroller
        unitroller = ComptrollerInterface(getAddress("Stub", "Unitroller"));

        vm.startBroadcast();

        for (uint256 i = 0; i < constants.markets().length; i++) {
            if (constants.markets()[i].tokenAddress == address(0)) {
                tokenAddress = getAddress("Tokens", constants.markets()[i].tokenSymbol);
            } else {
                tokenAddress = constants.markets()[i].tokenAddress;
            }
            token = IERC20(tokenAddress);
            cTokenDelegate = new CTokenDelegate();

            addAddress("CTokensDelegates", token.symbol(), address(cTokenDelegate));
            cTokenDelegator = new CTokenDelegator(
                address(token),
                unitroller,
                InterestRateModel(getAddress("InterestRateModels", constants.markets()[i].interestRateModelCode)),
                constants.initialExchangeRate(),
                string(abi.encodePacked("Compound Delegator - ", token.name)),
                string(abi.encodePacked("c", token.symbol(), "Delegator")),
                token.decimals(),
                payable(msg.sender),
                address(cTokenDelegate),
                hex""
            );
            addAddress("CTokensDelegators", token.symbol(), address(cTokenDelegator));
        }

        vm.stopBroadcast();
    }
}
