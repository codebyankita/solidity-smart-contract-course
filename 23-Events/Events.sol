// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @notice Demonstrates how to declare and emit events in Solidity
contract Event {
    /// @dev Logs the sender's address and a message
    event Log(address indexed sender, string message);

    /// @dev Logs when no additional data is required
    event AnotherLog();

    /// @notice Emits sample events for demonstration purposes
    function test() public {
        // Emit an event with the caller's address and a message
        emit Log(msg.sender, "Hello World!");

        // You can emit the same event multiple times with different data
        emit Log(msg.sender, "Hello EVM!");

        // Emit an event without parameters
        emit AnotherLog();
    }
}
