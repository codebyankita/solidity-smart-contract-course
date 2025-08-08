// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Account Contract with Deposit & Withdraw Functions and Overflow/Underflow Checks
/// @author CodeByAnkita
/// @notice Demonstrates use of require, revert, and assert for safety
contract Account {
    uint256 public balance;
    uint256 public constant MAX_UINT = type(uint256).max;

    /// @notice Adds `_amount` to the account balance
    /// @dev Includes overflow checks using require and assert
    function deposit(uint256 _amount) public {
        uint256 oldBalance = balance;
        uint256 newBalance = balance + _amount;

        // Check for overflow
        require(newBalance >= oldBalance, "Overflow detected");

        balance = newBalance;

        // Post-condition check using assert
        assert(balance >= oldBalance);
    }

    /// @notice Subtracts `_amount` from the account balance
    /// @dev Includes underflow checks using require and assert
    function withdraw(uint256 _amount) public {
        uint256 oldBalance = balance;

        // Check for underflow before subtracting
        require(balance >= _amount, "Underflow detected");

        // Redundant check with revert (for demonstration)
        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        // Post-condition: balance should be less than or equal to previous
        assert(balance <= oldBalance);
    }
}
