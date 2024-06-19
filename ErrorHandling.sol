// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplePointBank {
    mapping(address => uint256) public balances;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += amount;
    }
    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
    }
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    function checkInvariant() external view {
        assert(address(this).balance >= 0);
    }

    function emergencyWithdraw() external {
        require(msg.sender == owner, "Only the owner can perform an emergency withdrawal");
        if (address(this).balance == 0) {
            revert("No funds available for emergency withdrawal");
        }

        balances[owner] += address(this).balance;
    }
}
