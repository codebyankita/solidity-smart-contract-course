// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TaskOrganizer {
    // Defining a Struct for Entry
    struct Entry {
        string title;
        bool finished;
    }

    // Array to store all entries
    Entry[] public entries;

    // Function to add a new entry (demonstrating 3 ways to initialize structs)
    function addEntry(string calldata _title) public {
        // Method 1: Direct assignment (Function-like)
        entries.push(Entry(_title, false));

        // Method 2: Named arguments (Key-value mapping)
        entries.push(Entry({title: _title, finished: false}));

        // Method 3: Individual assignments
        Entry memory entry;
        entry.title = _title;
        // entry.finished is initialized to false by default
        entries.push(entry);
    }

    // Function to retrieve an entry by index
    function fetchEntry(uint256 _index) public view returns (string memory title, bool finished) {
        require(_index < entries.length, "Invalid index");
        Entry storage entry = entries[_index];
        return (entry.title, entry.finished);
    }

    // Function to update entry title
    function changeTitle(uint256 _index, string calldata _title) public {
        require(_index < entries.length, "Invalid index");
        Entry storage entry = entries[_index];
        entry.title = _title;
    }

    // Function to toggle entry completion status
    function toggleFinished(uint256 _index) public {
        require(_index < entries.length, "Invalid index");
        Entry storage entry = entries[_index];
        entry.finished = !entry.finished;
    }
}