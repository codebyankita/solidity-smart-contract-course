// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @notice A simple contract with a public state variable
contract Helloworld {
    // This is a public state variable
    // Solidity automatically creates a getter function for public variables
    string public greet = "Hello World!";
}

/// @notice A contract using a pure function to return a fixed string
contract Helloworld01 {
    // Pure function: does not read or modify blockchain state
    function sayhelloWorld() public pure returns (string memory) {
        return "hello world!";
    }
}

/// @notice A contract demonstrating private variable with getter and setter
contract Helloworld02 {
    // Private state variable (no auto-generated getter)
    string private word = "Hello world";

    // View function to read the value of the private variable
    function getword() public view returns (string memory) {
        return word;
    }

    // Function to update the value of the private variable
    function setword(string memory newWord) public returns (string memory) {
        word = newWord;
        return word;
    }
}
