// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleStorage {
    // State variable to store a number
    uint256 public num;

    // Set a new value to the state variable
    function set(uint256 _num) public {
        num = _num;
    }

    // Read the current value of the state variable
    function get() public view returns (uint256) {
        return num;
    }
}
