// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Helloworld {
    /// @notice Returns a fixed Hello World message
    /// @dev This is a pure function as it doesn't access any state variables
    function sayhelloWorld() public pure returns (string memory) {
        return "hello world!";
    }
}
