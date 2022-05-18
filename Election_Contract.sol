pragma solidity ^0.8.2;

//SPDX-License-Identifier: MIT

contract Election {
    
    // Model a Candidate contains three params

    struct  Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    
    address public owner;

    // Store accounts that have voted
    mapping(address => bool) public voters;

    // Fetch Candidate
    mapping(uint => Candidate) public candidates;

    // Store Candidates Count
    uint public candidatesCount;   

    function addCandidate(string memory _name) public {
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
        candidatesCount++;
    }

    function Vote(uint _candidateId) public {
    
    // require that they haven't voted before
    require(voters[msg.sender] == false, "Already voted !!");

    // require a valid candidate
    require(candidates[_candidateId].id == _candidateId);

    // record that voter has voted
    voters[msg.sender] = true;

    // update candidate vote Count
    candidates[_candidateId].voteCount++;


    }
}
