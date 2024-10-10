// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.sol";

contract TokensScript is BaseScript {
    function run() public {
        vm.startBroadcast();
        vm.stopBroadcast();
    }
}
