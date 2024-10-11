// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {BaseScript} from "./BaseScript.sol";
import {MockedERC20} from "../src/Mock/MockedERC20.sol";
import {EIP20Interface} from "../src/EIP20Interface.sol";

contract TokensScript is BaseScript {
    function run() public {
        vm.startBroadcast();
        string memory tokenSymbol;
        for (uint256 i = 0; i < constants.markets().length; i++) {
            if (constants.markets()[i].tokenAddress == address(0)) {
                new MockedERC20(
                    constants.markets()[i].tokenName,
                    constants.markets()[i].tokenSymbol,
                    constants.markets()[i].tokenDecimals,
                    100e18,
                    msg.sender
                );
                tokenSymbol = constants.markets()[i].tokenSymbol;
            } else {
                tokenSymbol = EIP20Interface(
                    constants.markets()[i].tokenAddress
                ).symbol();
            }
            addAddress(
                string(abi.encodePacked("T-", tokenSymbol)),
                constants.markets()[i].tokenAddress
            );
        }
        vm.stopBroadcast();
    }
}
