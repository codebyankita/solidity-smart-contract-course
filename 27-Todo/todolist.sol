// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Simple Todo List Contract
/// @notice Lets you add, remove, and mark todos as complete/incomplete
contract TodoList {
    /// @dev Each todo has text and a status
    struct Todo {
        string text;
        bool isDone;
    }

    /// @dev Stores all todos in a dynamic array
    Todo[] private todos;

    /// @notice Add a new todo item
    /// @param _text The text/description of the todo
    function addTodo(string memory _text) public {
        todos.push(Todo(_text, false));
    }

    /// @notice Remove a todo by index
    /// @dev Uses "swap and pop" to avoid leaving gaps
    function removeTodo(uint256 _index) public {
        require(_index < todos.length, "Invalid index");
        todos[_index] = todos[todos.length - 1];
        todos.pop();
    }

    /// @notice Get all todos
    /// @return An array of Todo structs
    function getAllTodos() public view returns (Todo[] memory) {
        return todos;
    }

    /// @notice Mark a todo as completed
    function completeTodo(uint256 _index) public {
        require(_index < todos.length, "Invalid index");
        todos[_index].isDone = true;
    }

    /// @notice Mark a todo as not completed
    function uncompleteTodo(uint256 _index) public {
        require(_index < todos.length, "Invalid index");
        todos[_index].isDone = false;
    }
}
