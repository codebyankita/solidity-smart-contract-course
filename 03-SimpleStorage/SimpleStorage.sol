//SPDX-License-Identifier:MIT
pragma solidity ^0.8.26;

contract SimpleStorage{
    uint256 private StoreNumber;

    function store (uint256 _number)public{
        StoreNumber =_number;
    }

    function retrive() public view returns (uint256){
        return StoreNumber;
    }
}




