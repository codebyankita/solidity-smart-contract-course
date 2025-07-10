// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Helloworld{
    string private word = "Hello world";
    function getword() public view returns (string memory){
        return word;
    }
    function setword (string memory newWord) public returns (string memory){
        word = newWord;
        return word;
    }
 

}