// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.s.sol";
import {InterestRateModelHarness} from "../src/InterestModelFixedHarness.sol";

contract IRMsScript is BaseScript {
    function run() public {
        vm.startBroadcast();
        addAddress("InterestRateModels", "Harness", address(new InterestRateModelHarness(0)));
        vm.stopBroadcast();
    }
}
