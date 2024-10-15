// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.s.sol";
import {SimplePriceOracle} from "../src/SimplePriceOracle.sol";

contract PriceOracleScript is BaseScript {
    function run() public {
        vm.startBroadcast();
        addAddress("PriceOracles", "SimplePriceOracle", address(new SimplePriceOracle()));
        vm.stopBroadcast();
    }
}
