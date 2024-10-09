// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {SimplePriceOracle as PriceOracle} from "../src/SimplePriceOracle.sol";

contract StubScript is Script {
    PriceOracle public priceOracle;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        priceOracle = new PriceOracle();
        vm.stopBroadcast();
    }
}
