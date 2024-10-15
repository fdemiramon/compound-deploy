// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Deploy} from "../script/Deploy.s.sol";

contract DeploymentTest is Test {
    function setUp() public {
        vm.chainId(1);
    }

    function test_Deployment() public {
        (new Deploy()).run();
    }
}
