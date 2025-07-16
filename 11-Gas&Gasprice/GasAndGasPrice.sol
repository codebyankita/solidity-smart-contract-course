// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Gas {
    // Returns the gas price of the current transaction
    function testGasRefund() public returns (uint256) {
        return tx.gasprice;
    }

    uint256 public i = 0;

    // Infinite loop to consume all gas and trigger out-of-gas error
    function forever() public {
        while (true) {
            i += 1;
        }
    }
}
