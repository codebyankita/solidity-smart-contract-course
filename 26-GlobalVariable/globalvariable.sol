// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Global Variables Demo
/// @notice Shows how to access different global variables in Solidity
contract GlobalVariables {
    uint256 public baseFee;       // Current block's base fee (EIP-1559)
    uint256 public chainId;       // Chain ID of the current blockchain
    uint256 public blockNumber;   // Current block number
    uint256 public gasLimit;      // Gas limit of the current block
    address public minerAddress;  // Address of the block miner (a.k.a. coinbase)
    uint256 public timestamp;     // Timestamp of the current block
    bytes32 public blockHash;     // Hash of the previous block

    constructor() {
        // Initialize state variables with global values
        baseFee = block.basefee;
        chainId = block.chainid;
        blockNumber = block.number;
        gasLimit = block.gaslimit;
        minerAddress = block.coinbase;
        timestamp = block.timestamp;
        blockHash = blockhash(block.number - 1); // Get hash of the previous block
    }
}
