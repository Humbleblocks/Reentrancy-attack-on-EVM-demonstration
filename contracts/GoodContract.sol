// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract GoodContract {
    mapping(address => uint) public balance;

    function addBalance() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(balance[msg.sender] >0);
        (bool sent, ) = msg.sender.call{value: balance[msg.sender]}("");
        require(sent, "Failed to send ether");
     // Becomes unreachable 

     balance [msg.sender] = 0;


    }
}