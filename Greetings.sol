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
