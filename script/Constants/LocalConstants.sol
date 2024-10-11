// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseConstants} from "./BaseConstants.sol";
import {Script, console} from "forge-std/Script.sol";

contract LocalConstants is BaseConstants {
    constructor() {
        _markets.push(
            Market(address(0), "DAI", "DAI", 18, "IRM-ABC", 300000000000000000)
        );
        _markets.push(
            Market(address(0), "USDC", "USDC", 6, "IRM-ABC", 300000000000000000)
        );
        _markets.push(
            Market(address(0), "USDT", "USDT", 6, "IRM-ABC", 300000000000000000)
        );
        _markets.push(
            Market(address(0), "WBTC", "WBTC", 6, "IRM-DEF", 300000000000000000)
        );
    }
}
