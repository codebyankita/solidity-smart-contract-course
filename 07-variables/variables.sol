// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Variables {
    // State variables: stored on the blockchain
    string public text = "Hello";
    uint256 public num = 819;

    function doSomthing() public view returns (uint256, uint256, address) {
        // Local variable: exists only during function execution
        uint256 i = 456;

        // Global variables: provide blockchain-related info
        uint256 timestamp = block.timestamp;  // current block timestamp
        address sender = msg.sender;          // address of the caller

        return (i, timestamp, sender);
    }
}
