// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Function - Demonstrates function return styles, destructuring, and array handling
contract Function {
    // Return multiple values
    function returnMany() public pure returns (uint256, bool, uint256) {
        return (1, true, 2);
    }

    // Named return values
    function named() public pure returns (uint256 x, bool b, uint256 y) {
        return (1, true, 2);
    }

    // Assign values directly to named returns (no explicit return statement needed)
    function assigned() public pure returns (uint256 x, bool b, uint256 y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Destructuring assignment example
    function destructuringAssignments()
        public
        pure
        returns (uint256, bool, uint256, uint256, uint256)
    {
        (uint256 i, bool b, uint256 j) = returnMany();
        (uint256 x,, uint256 y) = (4, 5, 6); // skip middle value
        return (i, b, j, x, y);
    }

    // Example: array as input
    function arrayInput(uint256[] memory _arr) public {
        // Do something with _arr
    }

    // Example: array as output
    uint256[] public arr;
    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}

/// @title XYZ - Demonstrates calling functions with positional and key-value arguments
contract XYZ {
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint256) {
        return x + y + z; // Example logic
    }

    // Call function using positional arguments
    function callFunc() external pure returns (uint256) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    // Call function using key-value arguments (order doesn't matter)
    function callFuncWithKeyValue() external pure returns (uint256) {
        return someFuncWithManyInputs({
            a: address(0),
            b: true,
            c: "c",
            x: 1,
            y: 2,
            z: 3
        });
    }
}
