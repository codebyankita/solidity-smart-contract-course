// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./EntryModels.sol";

contract TaskOrganizerApp {
    Entry[] public taskList;

    function add(string calldata title) public {
        taskList.push(Entry(title, false));
    }
}
