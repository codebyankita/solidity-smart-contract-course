// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./EnumDeclaration.sol";

/**
 * @title Enum
 * @dev Example of importing enum from another file
 */
contract Enum {
    // Reference enum from the imported contract
    EnumDeclaration.Status public status;
}
