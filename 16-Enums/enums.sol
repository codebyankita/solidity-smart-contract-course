// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title EnumDeclaration
 * @dev Defines the `Status` enum and basic functions to interact with it
 */
contract EnumDeclaration {
    // Enum to represent order shipping status
    enum Status {
        Pending,   // 0
        Shipping,  // 1
        Accepted,  // 2
        Rejected,  // 3
        Canceled   // 4
    }

    // Public variable to hold the current status
    Status public status;

    // Get current status
    function get() public view returns (Status) {
        return status;
    }

    // Set status
    function set(Status _status) public {
        status = _status;
    }

    // Set status to Canceled
    function cancel() public {
        status = Status.Canceled;
    }

    // Reset to default (first enum value: Pending)
    function reset() public {
        delete status;
    }
}
