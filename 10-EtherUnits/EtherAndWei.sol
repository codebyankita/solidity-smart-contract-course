// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Etherunits{
    uint256 public oneWei = 1 wei;
    bool public isOneWei = (oneWei ==1);

     uint256 public oneGwei = 1 gwei;
    bool public isOneGwei = (oneGwei ==1e9 );

     uint256 public oneEther = 1 ether;
    bool public isOneEther = (oneEther == 1e18);

}


contract UnitsOfEth{
    constructor() payable{}

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }
    function getBalanceEth() public view returns(uint256){
        return address(this).balance/1 ether;
    }
    function getBalanceEth2()public view returns (uint256){
        return address(this).balance/1e18;
    }

    function getBalanceGwei() public view returns(uint256){
        return address(this).balance/1 gwei;
    }
}

contract UnitsOfEth2 {
    constructor() payable {}

    // 👇 Add this
    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getBalanceEth() public view returns (uint256) {
        return address(this).balance / 1 ether;
    }

    function getBalanceEth2() public view returns (uint256) {
        return address(this).balance / 1e18;
    }

    function getBalanceGwei() public view returns (uint256) {
        return address(this).balance / 1 gwei;
    }
}