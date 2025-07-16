// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Primitives{
    bool public boo = true;

/*
    uint stands for unsigned integer, meaning non negative integers
    different sizes are available
        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
    */
   // Unsigned integers (only positive)
    uint8 public u8 = 1;          // 0 to 2^8 - 1
    uint256 public u256 = 456;    // 0 to 2^256 - 1
    uint256 public u = 123;

 /*
    Negative numbers are allowed for int types.
    Like uint, different ranges are available from int8 to int256
    
    int256 ranges from -2 ** 255 to 2 ** 255 - 1
    int128 ranges from -2 ** 127 to 2 ** 127 - 1
    */
    // Signed integers (positive & negative)
    int8 public i8 = -1;          // -128 to 127
    int256 public i256 = 456;
    int256 public i = -123;

 // Min and max values of int256
    int256 public minInt =type(int256).min;
    int256 public maxInt = type(int256).max;
// Ethereum address type
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
    In Solidity, the data type byte represent a sequence of bytes. 
    Solidity presents two types of bytes :

     - fixed-sized byte arrays
     - dynamically-sized byte arrays.
     
     The term bytes in Solidity represents a dynamic array of bytes. 
     It’s a shorthand for byte[] .
    */
 // Bytes1 holds one byte (8 bits)
    bytes1 a = 0xb5;//[10110101]
    bytes1 b =0x56;

 // Default values for uninitialized variables
    bool public defaultBoo;
    uint256 public defaultUint;
    int256 public defaultInt;
    address public defaultAddress;


}