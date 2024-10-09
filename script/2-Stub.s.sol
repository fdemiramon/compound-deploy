// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Unitroller} from "../src/Unitroller.sol";
import {Comptroller} from "../src/Comptroller.sol";
import {ComptrollerInterface} from "../src/ComptrollerInterface.sol";
import "./Constants.sol";

contract StubScript is Script {
    Unitroller public unitroller;
    Comptroller public comptroller;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        unitroller = new Unitroller();
        comptroller = new Comptroller();
        unitroller._setPendingImplementation(address(comptroller));
        comptroller._become(unitroller);

        ComptrollerInterface(address(unitroller))._setCloseFactor(closeFactor);
        ComptrollerInterface(address(unitroller))._setLiquidationIncentive(
            liquidationIncentive
        );

        vm.stopBroadcast();

        // See @https://github.com/AngleProtocol/angle-governance/blob/6e48f3f0a308af8c3abb7b32b4df7ec7c13fb587/scripts/Utils.s.sol#L2
        // string memory addressesKey = ".addresses";
        // vm.serializeAddress(addressesKey, "Unitroller", address(unitroller));
        // string memory output = vm.serializeAddress(
        //     addressesKey,
        //     "Comptroller",
        //     address(comptroller)
        // );
        // vm.writeJson(output, "./out/example.json");
    }
}
