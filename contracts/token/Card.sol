// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC721/ERC721.sol)

pragma solidity ^0.8.4;

import "./ERC721/ERC721.sol";

import 'hardhat/console.sol';

contract Card is ERC721 {
    struct Card {
        string name;
        string color;
    }

    Card[] public cards;
    string[] public colors = ["RED","BLUE","GREEN","PINK","YELLOW","BLACK","WHITE"];
    address public owner;

    constructor() ERC721("Card","CDT") {
        owner = msg.sender;
    }

    modifier isOwner {
        require(owner == msg.sender, "owner is not msg.sender");
        _;
    }

    function mint(string memory _name, address _account) public isOwner {
        uint cardId = cards.length;

        uint randNonce = 0;
        uint random = uint(keccak256(abi.encode(block.timestamp,msg.sender,randNonce))) % colors.length;

        cards.push(Card(_name,colors[random]));

        console.log("name : %s, color : %s",cards[cards.length-1].name,cards[cards.length-1].color);

        _mint(_account, cardId);

    }

    function getCardInfo(uint index) public view returns(Card memory){
        return cards[index];
    }
}