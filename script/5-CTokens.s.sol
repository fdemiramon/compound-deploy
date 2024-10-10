// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {EIP20Interface} from "../src/EIP20Interface.sol";
import {BaseScript} from "./BaseScript.sol";
import {ComptrollerInterface} from "../src/ComptrollerInterface.sol";

contract CTokensScript is BaseScript {
    // ComptrollerInterface public unitroller =
    //     ComptrollerInterface(getAddress("Comptroller"));

    function run() public {
        vm.startBroadcast();

        for (uint256 i = 0; i < constants.markets().length; i++) {}

        vm.stopBroadcast();
    }
}
