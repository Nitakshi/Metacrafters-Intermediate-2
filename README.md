# Enhanced DApp

This project is a simple decentralized application (DApp) that interacts with a smart contract deployed on the Ethereum blockchain. The smart contract allows users to set and retrieve a greeting message, increment a counter, and add user messages.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
- [Deploying the Smart Contract](#deploying-the-smart-contract)
- [Running the Frontend](#running-the-frontend)
- [Interacting with the DApp](#interacting-with-the-dapp)

## Features

- Set and retrieve a greeting message.
- Increment and view a counter.
- Add and retrieve user messages.

## Requirements

- [Node.js](https://nodejs.org/)
- [MetaMask](https://metamask.io/) (Browser extension)
- [Remix IDE](https://remix.ethereum.org/) or [Truffle](https://www.trufflesuite.com/) / [Hardhat](https://hardhat.org/) for smart contract deployment
- [HTTP server](https://www.npmjs.com/package/http-server) (for serving the frontend)

## Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/enhanced-dapp.git
cd enhanced-dapp
```

##Deploying the Smart Contract
# Using Remix IDE
Open Remix IDE.
Create a new file named Greetings.sol and paste the following code:

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Greeting { // Contract name capitalized
    string private greeting;
    uint256 private counter;
    string[] private userMessages;

    address private owner;

    event GreetingChanged(string oldGreeting, string newGreeting);
    event CounterIncremented(uint256 newCounter);
    event CounterReset(uint256 resetCounter);
    event MessageAdded(string message);

    constructor(string memory _greeting) {
        greeting = _greeting;
        counter = 0;
        owner = msg.sender; // Set the contract deployer as the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function setGreeting(string memory _greeting) public onlyOwner {
        string memory oldGreeting = greeting;
        greeting = _greeting;
        emit GreetingChanged(oldGreeting, _greeting);
    }

    function getGreeting() external view returns (string memory) {
        return greeting;
    }

    function incrementCounter() public {
        counter += 1;
        emit CounterIncremented(counter);
    }

    function resetCounter() public onlyOwner {
        counter = 0;
        emit CounterReset(counter);
    }

    function getCounter() external view returns (uint256) {
        return counter;
    }

    function addMessage(string memory _message) public {
        userMessages.push(_message);
        emit MessageAdded(_message);
    }

    function getMessages() external view returns (string[] memory) {
        return userMessages;
    }

    // If you want to include the owner getter function, uncomment it:
    // function getOwner() external view returns (address) {
    //     return owner;
    // }
}

```
Compile the smart contract.
Deploy the smart contract to an Ethereum test network (e.g., Ropsten, Rinkeby) using MetaMask.

## Running the Frontend
Replace YOUR_CONTRACT_ADDRESS in the index.html file with the address of the deployed smart contract.
Serve the frontend using an HTTP server:

## Interacting with the DApp
Connect MetaMask: Ensure MetaMask is installed and connected to the same network as the deployed smart contract.
View Greeting: The current greeting message will be displayed.
Set Greeting: Enter a new greeting message and click "Set Greeting".
View Counter: The current counter value will be displayed.
Increment Counter: Click "Increment Counter" to increase the counter value.
View and Add Messages: Enter a new message and click "Add Message" to add to the list of user messages. The list of messages will be displayed.

## License
This project is licensed under the MIT License.
