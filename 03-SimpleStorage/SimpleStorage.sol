// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract SimpleStorage {
    uint256 private StoreNumber; // private state variable to hold the number

    /// @notice Stores a new number
    function store(uint256 _number) public {
        StoreNumber = _number;
    }

    /// @notice Returns the stored number
    function retrive() public view returns (uint256) {
        return StoreNumber;
    }
}
