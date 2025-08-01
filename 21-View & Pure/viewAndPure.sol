// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title ViewAndPure - Demonstrates view and pure functions in Solidity
contract ViewAndPure {
    uint256 public x = 1; // State variable

    /// @notice View function - can read state but cannot modify it
    /// @param y Value to add to x
    /// @return Sum of stored x and y
    function addToX(uint256 y) public view returns (uint256) {
        return x + y;
    }

    /// @notice Pure function - cannot read or modify state
    /// @param i First number
    /// @param j Second number
    /// @return Sum of i and j
    function add(uint256 i, uint256 j) public pure returns (uint256) {
        return i + j;
    }
}
