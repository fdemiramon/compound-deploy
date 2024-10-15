// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IConstants} from "./Constants/IConstants.sol";
import {LocalConstants} from "./Constants/LocalConstants.sol";
import {Script, console} from "forge-std/Script.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import {stdJson} from "forge-std/StdJson.sol";
using stdJson for string;

contract BaseScript is Script {
    // @dev Constants to be loaded
    IConstants internal constants;

    mapping(string => address) internal addresses;

    string jsonKey = "addresses";

    constructor() {
        constants = new LocalConstants();
    }

    function addAddress(string memory topKey, string memory key, address value) internal {
        string memory jsonContent = readFile(topKey);
        console.log(jsonContent);
        vm.serializeJson(jsonKey, jsonContent);
        string memory output = vm.serializeAddress(jsonKey, key, value);
        vm.writeJson(output, filePath(topKey));
    }

    function getAddress(string memory topKey, string memory key) internal returns (address) {
        string memory jsonContent = readFile(topKey);
        return abi.decode(vm.parseJson(jsonContent, string(abi.encodePacked(".", key))), (address));
    }

    function filePath(string memory topKey) public view returns (string memory) {
        return string(
            abi.encodePacked(vm.projectRoot(), "/addresses/", Strings.toString(block.chainid), "-", topKey, ".json")
        );
    }

    function readFile(string memory topKey) internal returns (string memory) {
        string memory jsonContent;
        if (vm.exists(filePath(topKey))) {
            jsonContent = vm.readFile(filePath(topKey));
        } else {
            jsonContent = "{}";
        }
        return jsonContent;
    }
}
