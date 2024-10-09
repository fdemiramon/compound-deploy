// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

struct Market {
    string tokenName;
    string tokenSymbol;
    string tokenDecimals;
    address tokenAddress;
    address interestRateModelAddress;
    uint256 collateralFactor;
}

Market[] public markets;


// @dev The additional collateral given to liquidators as an incentive to perform liquidation of underwater accounts. A portion of this is given to the collateral cToken reserves as determined by the seize share. The seize share is assumed to be 0 if the cToken does not have a protocolSeizeShareMantissa constant. For example, if the liquidation incentive is 1.08, and the collateral’s seize share is 1.028, liquidators receive an extra 5.2% of the borrower’s collateral for every unit they close, and the remaining 2.8% is added to the cToken’s reserves.
uint256 constant liquidationIncentive = 1080000000000000000;

// @dev The percent, ranging from 0% to 100%, of a liquidatable account’s borrow that can be repaid in a single liquidate transaction. If a user has multiple borrowed assets, the closeFactor applies to any single borrowed asset, not the aggregated value of a user’s outstanding borrowing.
uint256 constant closeFactor = 500000000000000000;

// @dev Maximum number of assets that can be entered into a single liquidation. Does not seem to be used
uint256 constant maxAssets = 20;

    markets.push(Market(_owner, _price));
}

// @dev The location of the addresses.json file.
string constant addresses = "/out/addresses.json";
