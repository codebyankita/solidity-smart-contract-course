// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title Mapping
 * @dev Demonstrates how to use basic mappings in Solidity
 */
contract Mapping {
    // Mapping from address to uint256
    mapping(address => uint256) public myMap;

    // Get the value associated with an address
    function get(address _addr) public view returns (uint256) {
        return myMap[_addr];
    }

    // Set the value for a specific address
    function set(address _addr, uint256 _i) public {
        myMap[_addr] = _i;
    }

    // Remove the value (reset to default) for a specific address
    function remove(address _addr) public {
        delete myMap[_addr];
    }
}

/**
 * @title NestedMapping
 * @dev Demonstrates nested mappings (address => uint => bool)
 */
contract NestedMapping {
    // Mapping from address => (uint256 => bool)
    mapping(address => mapping(uint256 => bool)) public nested;

    // Get value from nested mapping
    function get(address _addr1, uint256 _i) public view returns (bool) {
        return nested[_addr1][_i];
    }

    // Set value in nested mapping
    function set(address _addr1, uint256 _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    // Remove value from nested mapping
    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i];
    }
}
