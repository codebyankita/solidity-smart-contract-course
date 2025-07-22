// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Array – Examples of dynamic, fixed-size, and multidimensional arrays
contract Array {
    uint256[] public arr; // Dynamic array
    uint256[] public arr2 = [1, 2, 3]; // Pre-initialized dynamic array
    uint256[10] public fixedArr; // Fixed-size array

    // Get a value at specific index
    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // Return full dynamic array (memory copy)
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    // Add value to array
    function push(uint256 i) public {
        arr.push(i);
    }

    // Remove last element
    function pop() public {
        arr.pop();
    }

    // Get current length of array
    function getLength() public view returns (uint256) {
        return arr.length;
    }

    // Delete value at specific index (sets to 0, doesn't shift)
    function remove(uint256 index) public {
        delete arr[index];
    }

    // Example of using memory arrays and 2D arrays
    function examples() external pure {
        uint256 ;

        // 2D dynamic array initialization
        uint256 ;
        for (uint256 i = 0; i < b.length; i++) {
            b ;
        }

        b[0][0] = 1;
        b[0][1] = 2;
        b[0][2] = 3;
        b[1][0] = 4;
        b[1][1] = 5;
        b[1][2] = 6;
    }
}

/// @title ArrayRemovalByShifting – Remove an element by shifting elements left
contract ArrayRemovalByShifting {
    uint256[] public arr;

    // Remove element by shifting all elements to the left
    function remove(uint256 index) public {
        require(index < arr.length, "Index out of bounds");
        for (uint256 i = index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    // Test removal functionality
    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2); // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0); // []
        assert(arr.length == 0);
    }
}

/// @title ArrayReplaceFromEnd – Remove element by replacing it with the last element
contract ArrayReplaceFromEnd {
    uint256[] public arr;

    // Remove element by replacing it with the last one (no order guarantee)
    function remove(uint256 index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    // Test removal by replacement from end
    function test() public {
        arr = [1, 2, 3, 4];
        remove(1); // [1, 4, 3]
        assert(arr.length == 3);

        remove(2); // [1, 4]
        assert(arr.length == 2);
    }
}
