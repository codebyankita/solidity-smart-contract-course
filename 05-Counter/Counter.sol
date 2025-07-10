//SPDX-License-Identifier:MIT
pragma solidity ^0.8.28;

contract Counter{
    uint256 public count;
    function Increment() public{
        count +=1;
    }
    function decrement () public {
        count -=1;
    }
    function getCount()public view returns(uint256){
        return count;
    }
}
