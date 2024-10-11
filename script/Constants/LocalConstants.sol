// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseConstants} from "./BaseConstants.sol";
import {Script, console} from "forge-std/Script.sol";

contract LocalConstants is BaseConstants {
    constructor() {
        _markets.push(
            Market(
                address(0),
                "Mocked DAI",
                "DAI",
                18,
                address(0),
                300000000000000000
            )
        );
        _markets.push(
            Market(
                address(0),
                "Mocked USDC",
                "USDC",
                6,
                address(0),
                300000000000000000
            )
        );
        _markets.push(
            Market(
                address(0),
                "MockedUSDT",
                "USDT",
                6,
                address(0),
                300000000000000000
            )
        );
        _markets.push(
            Market(
                address(0),
                "WBTC",
                "WBTC",
                6,
                address(0),
                300000000000000000
            )
        );
    }
}
