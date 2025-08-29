// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title A Simple Calculator Contract
/// @author CodeByAnkita
/// @notice Demonstrates basic arithmetic operations in Solidity
contract Calculator {
    int256 private result; // Stores the latest calculation result

    /// @notice Adds two numbers
    function add(int256 a, int256 b) public {
        result = a + b;
    }

    /// @notice Subtracts second number from the first
    function sub(int256 a, int256 b) public {
        result = a - b;
    }

    /// @notice Multiplies two numbers
    function mul(int256 a, int256 b) public {
        result = a * b;
    }

    /// @notice Divides first number by the second
    /// @dev Requires divisor not to be zero
    function div(int256 a, int256 b) public {
        require(b != 0, "Division by zero is not allowed");
        result = a / b;
    }

    /// @notice Returns the last stored result
    function getResult() public view returns (int256) {
        return result;
    }
}
