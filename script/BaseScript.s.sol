// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IConstants} from "./Constants/IConstants.sol";
import {LocalConstants} from "./Constants/LocalConstants.sol";
import {Script, console} from "forge-std/Script.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract BaseScript is Script {
    // @dev Constants to be loaded
    IConstants internal constants;

    // @dev The location of the addresses.json file.
    string internal addressesFilePath;

    mapping(string => address) internal addresses;

    string jsonKey = "addresses";

    constructor() {
        constants = new LocalConstants();
        addressesFilePath =
            string(abi.encodePacked(vm.projectRoot(), "/addresses/", Strings.toString(block.chainid), ".json"));
        string memory jsonContent = readFile();
        vm.serializeJson(jsonKey, jsonContent);
    }

    function addAddress(string memory key, address value) internal {
        string memory output = vm.serializeAddress(jsonKey, key, value);
        vm.writeJson(output, addressesFilePath);
    }

    function getAddress(string memory key) internal view returns (address) {
        string memory jsonContent = vm.readFile(addressesFilePath);
        key = string(abi.encodePacked(".", key));
        return abi.decode(vm.parseJson(jsonContent, key), (address));
    }

    function readFile() internal returns (string memory) {
        string memory jsonContent;
        if (vm.exists(addressesFilePath)) {
            jsonContent = vm.readFile(addressesFilePath);
        } else {
            jsonContent = "{}";
        }
        return jsonContent;
    }
}
