// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IConstants} from "./Constants/IConstants.sol";
import {LocalConstants} from "./Constants/LocalConstants.sol";
import {Script} from "forge-std/Script.sol";

contract BaseScript is Script {
    // @dev Constants to be loaded
    IConstants internal constants;

    // @dev The location of the addresses.json file.
    string internal addressesFilePath;

    mapping(string => address) internal addresses;

    string jsonKey = "addresses";

    constructor() {
        constants = new LocalConstants();
        addressesFilePath = "./out/addresses.json";
    }

    function addAddress(string memory key, address value) internal {
        string memory output = vm.serializeAddress(jsonKey, key, value);
        vm.writeJson(output, addressesFilePath);
    }

    function getAddress(string memory key) internal view returns (address) {
        return abi.decode(vm.parseJson(jsonKey, key), (address));
    }
}
