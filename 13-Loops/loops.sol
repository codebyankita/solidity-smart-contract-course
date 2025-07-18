// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Loops {
    // Fixed array of 100 shareholders
    address[100] public shareholders;

    // Counter used in loop function
    uint public count;

    // Example 1: Basic for loop
    function loop(uint n) public {
        for (uint i = 0; i < n; i++) {
            count += 1;
        }
    }

    // Example 2: Pay dividends to all shareholders
    function payDividends(uint amount) public payable {
        require(
            msg.value == amount * shareholders.length,
            "Incorrect ETH amount"
        );

        for (uint i = 0; i < shareholders.length; i++) {
            // Send specified amount to each shareholder
            payable(shareholders[i]).transfer(amount);
        }
    }

    // Example 3: Loop with break and continue
    function loopControl() external pure returns (uint result) {
        for (uint i = 0; i < 10; i++) {
            if (i == 3) continue; // skip when i == 3
            if (i == 5) break;    // stop when i == 5
            result += i;
        }
        // result = 0 + 1 + 2 + 4 = 7
    }

    // Example 4: While loop
    function whileLoop() external pure returns (uint total) {
        uint j = 0;
        while (j < 10) {
            total += j;
            j++;
        }
    }

    // Example 5: Sum of numbers from 1 to n
    function sum(uint n) external pure returns (uint s) {
        for (uint i = 1; i <= n; i++) {
            s += i;
        }
    }
}
