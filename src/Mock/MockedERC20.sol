// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockedERC20 is ERC20 {
    uint8 public customeDecimals;

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply,
        address _initiator
    ) ERC20(_name, _symbol) {
        customeDecimals = _decimals;
        _mint(_initiator, _initialSupply);
    }

    function decimals() public view virtual override returns (uint8) {
        return customeDecimals;
    }
}
