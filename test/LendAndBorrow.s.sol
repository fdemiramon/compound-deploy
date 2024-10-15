// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Deploy} from "../script/Deploy.s.sol";
import {BaseScript} from "../script/BaseScript.s.sol";
import {EIP20Interface} from "../src/EIP20Interface.sol";
import {CErc20Interface} from "../src/CTokenInterfaces.sol";

contract LendAndBorrowTest is Test, Deploy {
    BaseScript baseScript;

    function setUp() public {
        vm.chainId(2);
        run();
        baseScript = new BaseScript();
    }

    function test_Deployment() public {
        // string memory lentTokenSymbol = "DAI";
        // EIP20Interface lentToken = EIP20Interface(
        //     baseScript.getAddress("Tokens", lentTokenSymbol)
        // );
        // CErc20Interface cToken = CErc20Interface(
        //     baseScript.getAddress("CTokensDelegates", lentTokenSymbol)
        // );
        // lentToken.approve(address(cToken), lentToken.balanceOf(address(this)));
        // cToken.mint(lentToken.balanceOf(address(this)));
    }
}
