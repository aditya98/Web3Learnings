//Creating and deploying ERC- 721 NFT Code

//Initiate IPFS Daemon
ipfs init

//Start the IPFS daemon.
ipfs daemon

//Add an image to IPFS
ipfs add art.png

//Copy the hash starting from Qm and add the “https://ipfs.io/ipfs/” prefix to it

//Create a JSON file nft.json and save it in the same directory as the image. 
{
    "name": "NFT Art",
    "description": "This image shows the true nature of NFT.",
    "image": "https://ipfs.io/ipfs/QmZzBdKF7sQX1Q49CQGmreuZHxt9sVB3hTc3TTXYcVZ7jC",
}

//Add the Json file
ipfs add nft.json

//Creating our own token based on ERC721 standards using 0xcert/ethereum-erc721

//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
import https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol,
import https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol,
contract newNFT is NFTokenMetadata, Ownable {
  constructor() {
    nftName = MyNFT;
    nftSymbol = MYN;
  }
  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
  super._mint(_to, _tokenId);
  super._setTokenUri(_tokenId, _uri);
  }
}
