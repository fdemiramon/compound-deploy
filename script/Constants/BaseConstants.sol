// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IConstants} from "./IConstants.sol";

/// Default values
abstract contract BaseConstants is IConstants {
    Market[] public _markets;

    uint256 public _liquidationIncentive = 1080000000000000000;

    uint256 public _closeFactor = 500000000000000000;

    uint256 public _maxAssets = 20;

    uint256 public _initialExchangeRate = 1000000000000000000;

    function markets() external view returns (Market[] memory) {
        return _markets;
    }

    function initialExchangeRate() external view returns (uint256) {
        return _initialExchangeRate;
    }

    function liquidationIncentive() external view returns (uint256) {
        return _liquidationIncentive;
    }

    function closeFactor() external view returns (uint256) {
        return _closeFactor;
    }

    function maxAssets() external view returns (uint256) {
        return _maxAssets;
    }
}
