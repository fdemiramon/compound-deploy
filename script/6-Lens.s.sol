// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.s.sol";
import {CompoundLens} from "../src/Lens/CompoundLens.sol";

contract CompoundLensScript is BaseScript {
    CompoundLens public compoundLens;

    function run() public {
        vm.startBroadcast();
        addAddress("Contracts", "CompoundLens", address(new CompoundLens()));
        vm.stopBroadcast();
    }
}
