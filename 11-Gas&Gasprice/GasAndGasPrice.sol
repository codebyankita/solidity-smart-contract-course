// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract gas{
    function testGasRefund() public returns (uint){
        return tx.gasprice;
    }

    uint256 public i= 0;
    function forever()public{
        while(true){
            i+=1;
        }
    }
}