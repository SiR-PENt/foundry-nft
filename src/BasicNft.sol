// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    //when we launch this contract, it actually represents an entire collection of dogies. 
    //and each dogie in this collection is gonna have its own unique tokenId 
    //so a unique nft is basically a combination of contract address (which basically represents the collection) and the tokenid
     
     // the below tokenCounter represents each tokenId
     uint256 private s_tokenCounter; //tokenCounter to represent each token id of the nfts
     mapping(uint256 => string) private s_tokenIdToUri;    
     
     constructor() ERC721("Dogie", "DOG") {}

     function mintNft(string memory tokenUri) public {
          s_tokenIdToUri[s_tokenCounter] = tokenUri;
          _safeMint(msg.sender, s_tokenCounter);
          s_tokenCounter++;
     }

     function tokenURI(uint256 tokenId) public view override returns (string memory) {
          return s_tokenIdToUri[tokenId];
     }

}