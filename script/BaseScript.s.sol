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

    // @dev The location of the addresses.json file.
    string internal addressesFilePath;

    mapping(string => address) internal addresses;

    string jsonKey = ".addresses";

    constructor() {
        constants = new LocalConstants();
        addressesFilePath =
            string(abi.encodePacked(vm.projectRoot(), "/addresses/", Strings.toString(block.chainid), ".json"));
        string memory jsonContent = readFile();
        vm.serializeJson(jsonKey, jsonContent);
    }

    function addAddress(string memory topKey, string memory key, address value) internal {
        string memory json = "json";
        string memory semiFinal = json.serialize(key, value);
        string memory json2 = "json2";
        string memory finalJson = json2.serialize(topKey, semiFinal);
        string memory output = vm.serializeJson(jsonKey, finalJson);
        console.log(output);
        vm.writeJson(output, addressesFilePath);
    }

    function getAddress(string memory topKey, string memory key) internal view returns (address) {
        string memory jsonContent = vm.readFile(addressesFilePath);
        topKey = string(abi.encodePacked(".", topKey));
        return abi.decode(vm.parseJson(abi.decode(vm.parseJson(jsonContent, topKey), (string)), key), (address));
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
