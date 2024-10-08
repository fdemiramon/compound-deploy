// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Unitroller} from "../src/Unitroller.sol";
import {Comptroller} from "../src/Comptroller.sol";

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

        vm.stopBroadcast();

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
