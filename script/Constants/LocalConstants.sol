// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseConstants} from "./BaseConstants.sol";
import {MockedERC20} from "../../src/Mock/MockedERC20.sol";
import {Script, console} from "forge-std/Script.sol";

contract LocalConstants is BaseConstants {
    constructor() {
        _markets.push(
            Market(
                (
                    address(
                        new MockedERC20("DAI", "DAI", 18, 100e18, msg.sender)
                    )
                ),
                address(0),
                300000000000000000
            )
        );
        _markets.push(
            Market(
                (
                    address(
                        new MockedERC20("USDC", "USDC", 6, 100e18, msg.sender)
                    )
                ),
                address(0),
                300000000000000000
            )
        );
        _markets.push(
            Market(
                (
                    address(
                        new MockedERC20("USDT", "USDT", 6, 100e18, msg.sender)
                    )
                ),
                address(0),
                300000000000000000
            )
        );
        _markets.push(
            Market(
                (
                    address(
                        new MockedERC20("WBTC", "WBTC", 18, 100e18, msg.sender)
                    )
                ),
                address(0),
                300000000000000000
            )
        );
    }
}
