## Error Handling

The solidity program "Error Handling" is a program in which I have discussed the working of various error handling techniques like Require, Assert, Revert.

## Description

The provided Solidity code defines a smart contract named SimplePointBank, which serves as a basic point banking system on the Ethereum blockchain. The contract includes mechanisms for users to deposit and withdraw points, view their balance, and for the owner to perform emergency withdrawals if necessary.

The contract has two main state variables: balances, a mapping that associates each user's Ethereum address with their point balance, and owner, which stores the address of the contract owner (the account that deployed the contract).

The constructor sets the owner to the deploying address. Users can deposit points using the deposit function, which requires the amount to be greater than zero and adds the specified amount to the user's balance. The withdraw function allows users to withdraw points, ensuring the amount is positive and that the user has enough balance. The getBalance function enables users to check their point balance.

The contract also includes a checkInvariant function, which asserts that the contract's balance is non-negative, serving as a basic check. The emergencyWithdraw function allows the owner to transfer all contract funds to their account, but only if the balance is non-zero. This function reverts the transaction if called by anyone other than the owner or if there are no funds available.
## Getting Started

### Installing

To download the code, you can visit the following file path:- https://github.com/chakshit2004h/ETH_intermidate_course/blob/main/Error_Handling.sol

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

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
        }}



To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.25" (or another compatible version), and then click on the "Compile errorHandling.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Error" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you will set the deposit in the bank and then you can check your balances, withdraw amount and there is also uses of require(), assert() and revert().


## Authors


Metacrafter Chris
@metacraftersio


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
