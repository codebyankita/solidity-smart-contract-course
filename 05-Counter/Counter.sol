// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Counter {
    // State variable to store the count
    uint256 public count;

    // Increments the count by 1
    function Increment() public {
        count += 1;
    }

    // Decrements the count by 1
    function decrement() public {
        count -= 1;
    }

    // Returns the current count value
    function getCount() public view returns (uint256) {
        return count;
    }
}
