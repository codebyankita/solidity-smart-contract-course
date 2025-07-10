// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Helloworld {
    string public greet = "Hello World!";
}

contract Helloworld01 {
    function sayhelloWorld() public pure returns (string memory){
        return "hello world!";
    }
}

contract Helloworld02{
    string private word = "Hello world";
    function getword() public view returns (string memory){
        return word;
    }
    function setword (string memory newWord) public returns (string memory){
        word = newWord;
        return word;
    }
 

}