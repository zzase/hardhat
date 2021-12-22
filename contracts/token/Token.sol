//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import 'hardhat/console.sol';

contract Token {

    string public name = "My hardhat Token";
    string public symbol = "ZST";

    uint256 public totalSupply = 100000;

    address public owner;

    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) external {
        console.log('to : %s, amount : %d',to,amount);

        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}