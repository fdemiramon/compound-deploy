// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.sol";
import {InterestRateModelHarness as InterestRateModel} from "../src/InterestModelFixedHarness.sol";

contract IRMsScript is BaseScript {
    InterestRateModel public interestRateModel;

    function run() public {
        vm.startBroadcast();
        addAddress("IRM-Harness", address(new InterestRateModel(0)));
        vm.stopBroadcast();
    }
}
