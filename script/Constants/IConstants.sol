// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IConstants {
    // @dev Description of the markets
    struct Market {
        address tokenAddress;
        string tokenName;
        string tokenSymbol;
        uint8 tokenDecimals;
        address interestRateModelAddress;
        uint256 collateralFactor;
    }

    function markets() external view returns (Market[] memory);

    // @dev The additional collateral given to liquidators as an incentive to perform liquidation of underwater accounts. A portion of this is given to the collateral cToken reserves as determined by the seize share. The seize share is assumed to be 0 if the cToken does not have a protocolSeizeShareMantissa constant. For example, if the liquidation incentive is 1.08, and the collateral’s seize share is 1.028, liquidators receive an extra 5.2% of the borrower’s collateral for every unit they close, and the remaining 2.8% is added to the cToken’s reserves.
    function liquidationIncentive() external view returns (uint256);

    // @dev The percent, ranging from 0% to 100%, of a liquidatable account’s borrow that can be repaid in a single liquidate transaction. If a user has multiple borrowed assets, the closeFactor applies to any single borrowed asset, not the aggregated value of a user’s outstanding borrowing.
    function closeFactor() external view returns (uint256);

    // @dev Maximum number of assets that can be entered into a single liquidation. Does not seem to be used
    function maxAssets() external view returns (uint256);
}
