// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Demonstrates how Ether units work in Solidity
contract Etherunits {
    uint256 public oneWei = 1 wei;
    bool public isOneWei = (oneWei == 1);

    uint256 public oneGwei = 1 gwei;
    bool public isOneGwei = (oneGwei == 1e9);

    uint256 public oneEther = 1 ether;
    bool public isOneEther = (oneEther == 1e18);
}

// Contract to test Ether balance conversions (wei to ether/gwei)
contract UnitsOfEth {
    // Contract can receive Ether during deployment
    constructor() payable {}

    // Returns balance in wei
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Returns balance in Ether using division by 1 ether
    function getBalanceEth() public view returns (uint256) {
        return address(this).balance / 1 ether;
    }

    // Same as above using 1e18 instead of 1 ether
    function getBalanceEth2() public view returns (uint256) {
        return address(this).balance / 1e18;
    }

    // Returns balance in Gwei
    function getBalanceGwei() public view returns (uint256) {
        return address(this).balance / 1 gwei;
    }
}

// Same as UnitsOfEth, but with a receive function to accept Ether after deployment
contract UnitsOfEth2 {
    constructor() payable {}

    // Allows contract to receive Ether directly
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
