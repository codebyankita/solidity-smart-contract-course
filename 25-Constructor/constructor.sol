// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Inheritance and Constructor Parameters in Solidity
/// @notice Demonstrates how constructor parameters are passed during inheritance
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

/// @notice Passing parameters directly in the inheritance list
contract B is X("input to X"), Y("input to Y") {
    // No need for a constructor here since values are fixed in the inheritance list
}

/// @notice Passing parameters via child constructor
contract C is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {
        // Values are passed dynamically during deployment
    }
}

/// @notice Demonstrates constructor call order
/// @dev Even though X is listed first in inheritance, Solidity will always follow the declared order
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
    // Constructor call order: X -> Y -> D
}

/// @notice Changing the inheritance order changes constructor call order
contract E is Y, X {
    constructor() Y("Y was called") X("X was called") {}
    // Constructor call order: Y -> X -> E
}
