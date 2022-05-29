//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract CrowdFunding{
    mapping(address=>uint) public contributors; //saves address and uint in contributors variable
    address public manager; // creates a public variable of type address named manager
    uint public minimumContribution; //creates a public variable of type uint256 named minimumContribution
    uint public deadline; //creates a public variable of type uint256 named deadline
    uint public target; //creates a public variable of type uint256 named target
    uint public raisedAmount; //creates a public variable of type uint256 named raisedAmount
    uint public noOfContributors; //creates a public variable of type uint named noOfContributors
    
    /*
    A new data type named request is created to identify the contributors/voters 
    */
    
    struct Request{
        string description;
        address payable recipient;
        uint value;
        bool completed;
        uint noOfVoters;
        mapping(address=>bool) voters;
    }
    mapping(uint=>Request) public requests; //store uint: Requests as requests
    uint public numRequests;
    constructor(uint _target,uint _deadline){
        target=_target;
        deadline=block.timestamp+_deadline; //10sec + 3600sec (60*60)
        minimumContribution=100 wei;
        manager=msg.sender;
    }
    
    function sendEth() public payable{
        require(block.timestamp < deadline,"Deadline has passed");
        require(msg.value >=minimumContribution,"Minimum Contribution is not met");
        
        if(contributors[msg.sender]==0){
            noOfContributors++;
        }
        contributors[msg.sender]+=msg.value;
        raisedAmount+=msg.value;
    }
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
