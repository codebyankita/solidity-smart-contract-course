// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract IfElse{
    function example(uint x)external pure returns(uint){
        if (x<10){
            return 1;
        } else if (x<20) {
            return 2;
        }else {
            return 3;
        }
    }

    function ternary(uint x) external pure returns (uint){
        // if (x<10){
        //     return 1;
        // }else{
        //     return 2;
        // }
        return x<10 ? 1 : 2;
        // condition ? if true : if false;

    }
}