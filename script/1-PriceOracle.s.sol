// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.sol";
import {SimplePriceOracle as PriceOracle} from "../src/SimplePriceOracle.sol";

contract PriceOracleScript is BaseScript {
    PriceOracle public priceOracle;

    function run() public {
        vm.startBroadcast();
        priceOracle = new PriceOracle();
        vm.stopBroadcast();
    }
}
