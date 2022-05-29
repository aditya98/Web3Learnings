//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Lottery{

    address payable[] public players; //array of address of players(variable declaration)
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    receive () payable external{
        require(msg.value == 0.1 ether);
        players.push(payable(owner));
    }

    function getBalance() public view returns(uint){
        require(msg.sender == owner);
        return address(this).balance;
    }

    function random() internal view returns(uint){
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }


    function pickWinner() public{

        require(msg.sender == owner);
        require (players.length >= 3);

        uint r = random();
        address payable winner;


        uint index = r % players.length;

        winner = players[index];

        winner.transfer(getBalance());


        players = new address payable[](0);
    }

}
