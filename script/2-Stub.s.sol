// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.s.sol";
import {Unitroller} from "../src/Unitroller.sol";
import {Comptroller} from "../src/Comptroller.sol";
import {ComptrollerInterface} from "../src/ComptrollerInterface.sol";

contract StubScript is BaseScript {
    Unitroller public unitroller;
    Comptroller public comptroller;

    function run() public {
        vm.startBroadcast();

        unitroller = new Unitroller();

        addAddress("Contracts", "Unitroller", address(unitroller));
        comptroller = new Comptroller();
        addAddress("Contracts", "Comptroller", address(comptroller));
        unitroller._setPendingImplementation(address(comptroller));
        comptroller._become(unitroller);

        ComptrollerInterface(address(unitroller))._setCloseFactor(constants.closeFactor());
        ComptrollerInterface(address(unitroller))._setLiquidationIncentive(constants.liquidationIncentive());

        vm.stopBroadcast();
    }
}
