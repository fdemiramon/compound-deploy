// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IConstants} from "./Constants/IConstants.sol";
import {LocalConstants} from "./Constants/LocalConstants.sol";
import {Script} from "forge-std/Script.sol";

contract BaseScript is Script {
    // @dev Constants to be loaded
    IConstants internal constants;

    // @dev The location of the addresses.json file.
    string internal addressesFile;

    constructor() {
        constants = new LocalConstants();
        addressesFile = "/out/addresses.json";
    }
}
