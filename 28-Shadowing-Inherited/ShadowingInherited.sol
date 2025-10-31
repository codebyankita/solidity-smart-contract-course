// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

/* ❌ Wrong way
contract B is A {
    string public name = "Contract B"; // ERROR
}
*/

contract C is A {
    constructor() {
        name = "Contract C";
    }
}
