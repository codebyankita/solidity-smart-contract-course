// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title DataLocations - Demonstrates storage, memory, and calldata usage in Solidity
contract DataLocations {
    uint256[] public arr; // Dynamic storage array
    mapping(uint256 => address) public map; // Mapping from uint to address

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) public myStructs;

    /// @notice Event to log calldata input for function h
    event CalldataReceived(uint256[] arr);

    /// @notice Demonstrates using storage and memory variables
    function f() public {
        // Pass storage references to an internal function
        _f(arr, map, myStructs[1]);

        // Get a struct from a mapping (storage reference)
        MyStruct storage myStruct = myStructs[1];

        // Create a struct in memory (temporary)
        MyStruct memory myMemStruct = MyStruct(0);

        // Silence unused variable warnings
        myStruct.foo;
        myMemStruct.foo;
    }

    /// @notice Internal function that modifies storage variables
    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        _arr.push(100); // Append to storage array
        _map[1] = msg.sender; // Store sender address in mapping
        _myStruct.foo = 500; // Update struct field
    }

    /// @notice Accepts a memory array, modifies it, and returns it
    function g(uint256[] memory _arr) public pure returns (uint256[] memory) {
        for (uint256 i = 0; i < _arr.length; i++) {
            _arr[i] += 1; // Increment each element
        }
        return _arr;
    }

    /// @notice Accepts a calldata array (read-only) and emits it
    function h(uint256[] calldata _arr) external {
        emit CalldataReceived(_arr);
    }
}
