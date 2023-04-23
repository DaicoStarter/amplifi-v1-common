// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {AccelerationMode} from "../models/AccelerationMode.sol";
import {RepaymentMode} from "../models/RepaymentMode.sol";
import {TokenInfo} from "../models/TokenInfo.sol";

/// @title Interface for Registrar
/// @notice Registrar is responsible for bootstrapping and managing global settings
interface IRegistrar {
    /// @notice Set the Bookkeeper associated with this Registrar, can only be set once
    /// @param bookkeeper The Bookkeeper
    function setBookkeeper(address bookkeeper) external;

    /// @notice Set the PUD associated with this Registrar, can only be set once
    /// @param pud The PUD
    function setPUD(address pud) external;

    /// @notice Set the Treasurer associated with this Registrar, can only be set once
    /// @param treasurer The Treasurer
    function setTreasurer(address treasurer) external;

    /// @notice Set the base interest rate
    /// @param interestRateUDx18 The base interest rate with 18 decimals of precision
    function setInterestRate(uint256 interestRateUDx18) external;

    /// @notice Set the liquidation penalty rate
    /// @param penaltyRateUDx18 The liquidation penalty rate with 18 decimals of precision
    function setPenaltyRate(uint256 penaltyRateUDx18) external;

    /// @notice Set the earning distribution rates
    /// @param distributionAddresses The addresses to distribute to
    /// @param distributionRatesUDx18 The rates of distribution with 18 decimals of precision
    function setDistributionRates(address[] calldata distributionAddresses, uint256[] calldata distributionRatesUDx18)
        external;

    /// @notice Set the interest acceleration mode
    /// @param accelerationMode The interest acceleration mode
    function setAccelerationMode(AccelerationMode accelerationMode) external;

    /// @notice Set the repayment priority mode
    /// @param repaymentMode The repayment priority mode
    function setRepaymentMode(RepaymentMode repaymentMode) external;

    /// @notice Set the info for a token
    /// @param token The token to set
    /// @param tokenInfo The info of the token
    function setTokenInfo(address token, TokenInfo calldata tokenInfo) external;

    /// @notice Get the Bookkeeper associated with this Registrar
    /// @return bookkeeper The Bookkeeper
    function getBookkeeper() external view returns (address bookkeeper);

    /// @notice Get the PUD associated with this Registrar
    /// @return pud The PUD
    function getPUD() external view returns (address pud);

    /// @notice Get the Treasurer associated with this Registrar
    /// @return treasurer The Treasurer
    function getTreasurer() external view returns (address treasurer);

    /// @notice Get the base interest rate
    /// @return interestRateUDx18 The base interest rate with 18 decimals of precision
    function getInterestRate() external view returns (uint256 interestRateUDx18);

    /// @notice Get the liquidation penalty rate
    /// @return penaltyRateUDx18 The liquidation penalty rate with 18 decimals of precision
    function getPenaltyRate() external view returns (uint256 penaltyRateUDx18);

    /// @notice Get the earning distribution rates
    /// @return distributionAddresses The addresses to distribute to
    /// @return distributionRatesUDx18 The rates of distribution with 18 decimals of precision
    function getDistributionRates()
        external
        view
        returns (address[] memory distributionAddresses, uint256[] memory distributionRatesUDx18);

    /// @notice Get the interest acceleration mode
    /// @return accelerationMode The interest acceleration mode
    function getAccelerationMode() external view returns (AccelerationMode accelerationMode);

    /// @notice Get the repayment priority mode
    /// @return repaymentMode The repayment priority mode
    function getRepaymentMode() external view returns (RepaymentMode repaymentMode);

    /// @notice Get the info for a token
    /// @param token The token to query
    /// @return tokenInfo The info of the token
    function getTokenInfoOf(address token) external view returns (TokenInfo memory tokenInfo);

    /// @notice Get the value of a fungible token in PUD
    /// @param token The token to query
    /// @param amount The amount to query
    /// @return value The value of the token in PUD
    function getValueOfFungibleToken(address token, uint256 amount) external view returns (uint256 value);

    /// @notice Get the values of fungible tokens in PUD
    /// @param tokens The tokens to query
    /// @param amounts The amounts to query
    /// @return values The values of the tokens in PUD
    function getValuesOfFungibleTokens(address[] calldata tokens, uint256[] calldata amounts)
        external
        view
        returns (uint256[] memory values);

    /// @notice Get the value of a non-fungible token in PUD
    /// @param token The token to query
    /// @param tokenId The id of the token
    /// @return value The value of the token in PUD
    function getValueOfNonFungibleToken(address token, uint256 tokenId) external view returns (uint256 value);

    /// @notice Get the values of non-fungible tokens in PUD
    /// @param token The token to query
    /// @param tokenIds The ids of the tokens
    /// @return values The values of the tokens in PUD
    function getValuesOfNonFungibleTokens(address token, uint256[] calldata tokenIds)
        external
        view
        returns (uint256[] memory values);

    /// @notice Get the values of non-fungible tokens in PUD
    /// @param tokens The tokens to query
    /// @param tokenIds The ids of the tokens
    /// @return values The values of the tokens in PUD
    function getValuesOfNonFungibleTokens(address[] calldata tokens, uint256[] calldata tokenIds)
        external
        view
        returns (uint256[] memory values);
}
