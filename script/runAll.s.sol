// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {PriceOracleScript} from "./1-PriceOracle.s.sol";
import {StubScript} from "./2-Stub.s.sol";
import {IRMsScript} from "./3-IRMs.s.sol";
import {TokensScript} from "./4-Tokens.s.sol";
import {CTokensScript} from "./5-CTokens.s.sol";

contract BaseScript is Script {
    function run() public {
        (new PriceOracleScript()).run();
        (new StubScript()).run();
        (new IRMsScript()).run();
        (new TokensScript()).run();
        (new CTokensScript()).run();
    }
}
