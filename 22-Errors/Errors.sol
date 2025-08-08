// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Error Handling Examples in Solidity
/// @author CodeByAnkita
/// @notice This contract demonstrates how to use require, revert, assert, and custom errors
contract Error {
    
    /// @notice Demonstrates the use of `require`
    /// @dev Validates input before execution
    /// @param _i User-provided input value
    function testRequire(uint256 _i) public pure {
        // Use `require` for input validation or pre-conditions
        require(_i > 10, "Input must be greater than 10");
    }

    /// @notice Demonstrates the use of `revert`
    /// @dev Useful when condition checking is more complex
    function testRevert(uint256 _i) public pure {
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    // A state variable to demonstrate `assert`
    uint256 public num;

    /// @notice Demonstrates the use of `assert`
    /// @dev Used to check for invariants (should never fail if the code is correct)
    function testAssert() public view {
        // `assert` is used to test for internal errors.
        // In this example, we assume num must always be 0.
        assert(num == 0);
    }

    // Declaring a custom error to save gas
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    /// @notice Demonstrates how to use a custom error
    /// @param _withdrawAmount Amount the caller wants to withdraw
    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 bal = address(this).balance;

        // Custom errors are more gas-efficient than strings
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}
