//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155Mock is ERC1155 {
  constructor(string memory _uri) ERC1155(_uri) {}

  function mint(uint256 _tokenId, uint256 _amount) public {
    _mint(msg.sender, _tokenId, _amount, "");
  }

  function burn(uint256 _tokenId, uint256 _amount) public {
    _burn(msg.sender, _tokenId, _amount);
  }
}
