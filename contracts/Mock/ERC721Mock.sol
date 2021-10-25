//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ERC721Mock is ERC721 {
  uint tokenId = 0;
  mapping(address => uint[]) public tokenIds;

  constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

  function mint() public {
    tokenId++;
    tokenIds[msg.sender].push(tokenId);
    _safeMint(msg.sender, tokenId);
  }

  function burn(uint _tokenId) public {
    _burn(_tokenId);
  }
}
