//SPDX-License-Identifier:MIT
pragma solidity ^0.8.26;

contract Variables{
    //state variables
    string public text ="Hello";
    uint256 public num = 819;


function doSomthing () public view returns(uint256, uint256, address) {
    //local variables
    uint256 i = 456 ;

    //global variables
    uint256 timestemp = block.timestamp;
    address sender = msg.sender;

    return (i, timestemp, sender);
}

}