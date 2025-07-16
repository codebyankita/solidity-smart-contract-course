// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Immutable {
    // Immutable variables: assigned once in the constructor, then fixed forever
    address public immutable myAddr;
    uint256 public immutable myUint;

    // Constructor sets values at deployment time
    constructor(uint256 _myUint) {
        myAddr = msg.sender;  // address of the contract deployer
        myUint = _myUint;     // value passed during deployment
    }
}
