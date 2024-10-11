// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IConstants} from "./Constants/IConstants.sol";
import {LocalConstants} from "./Constants/LocalConstants.sol";
import {Script, console} from "forge-std/Script.sol";

contract BaseScript is Script {
    // @dev Constants to be loaded
    IConstants internal constants;

    // @dev The location of the addresses.json file.
    string internal addressesFilePath;

    mapping(string => address) internal addresses;

    string jsonKey = "addresses";

    constructor() {
        constants = new LocalConstants();
        addressesFilePath = string(
            abi.encodePacked(vm.projectRoot(), "/out/addresses.json")
        );
        string memory jsonContent = vm.readFile(addressesFilePath);
        vm.serializeJson(jsonKey, jsonContent);
    }

    function addAddress(string memory key, address value) internal {
        // string memory jsonContent = vm.readFile(addressesFilePath);
        // string[] memory keys = vm.parseJsonKeys(jsonContent, jsonKey); // ["a", "b"]
        // address mappedAddress;
        // for (uint256 i = 0; i < keys.length; i++) {
        //     mappedAddress = getAddress[keys[i]];
        //     vm.serializeAddress(jsonKey, keys[i], mappedAddress);
        // }

        string memory output = vm.serializeAddress(jsonKey, key, value);
        vm.writeJson(output, addressesFilePath);
    }

    function getAddress(string memory key) internal view returns (address) {
        string memory jsonContent = vm.readFile(addressesFilePath);
        key = string(abi.encodePacked(".", key));
        return abi.decode(vm.parseJson(jsonContent, key), (address));
    }
}
