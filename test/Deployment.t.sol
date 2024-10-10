// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PriceOracleScript} from "../script/1-PriceOracle.s.sol";
import {StubScript} from "../script/2-Stub.s.sol";

contract DeploymentTest is Test {
    function test_Deployment() public {
        (new PriceOracleScript()).run();
        (new StubScript()).run();
    }
}
