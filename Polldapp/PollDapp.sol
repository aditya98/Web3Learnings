//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.7;

contract PollDapp{

string public questions; //Creates a string variable questions

string[] public options; //creates an array of string variables options

mapping (uint => uint) public voteCount; //Store for votecount on chain

mapping (address => uint) public castedVotes; //store casted votes corresponding to the address casting them

// constructor is analogous to main function in C,Py etc.
constructor(string memory _questions, string memory _options){
  questions = _questions;
  options = _options;
}

function getOptions() public view returns(string[] memory){
  return options;
}

function castVote(uint _optionIndex) public returns(string memory){
  address _calller = msg.sender //variable of type address is assigned the value of senderaddr
  
  require(existingVotesbyCaller == 0 , "Already Voted Once");
  
  uint existingNumberOfVotes = voteCount[_optionIndex];
  
  uint updatedNumberOfVotes = existingNumberOfVotes + 1;
  
  uint existingVotesByCaller = castedVotes[_caller];
  
  uint updateVotesByCaller = existingVotesByCaller + 1;
  
  return "Voted Successfully";  

}


}
