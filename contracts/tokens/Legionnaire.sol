//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../lib/Operatorable.sol";

// Sale contract
contract Legionnaire is ERC721Enumerable, ERC721URIStorage, Operatorable {
  constructor() ERC721("Satoshi's Legions - The Legionnaires", "LEGIONNAIRES")
  {

  }

  function _baseURI() internal pure override returns (string memory) {
    return "https://ipfs.io/ipfs/";
  }

  function _beforeTokenTransfer(
    address _from,
    address _to,
    uint256 _tokenId
  ) internal override(ERC721, ERC721Enumerable) whenNotPaused {
    ERC721Enumerable._beforeTokenTransfer(_from, _to, _tokenId);
  }

  function _burn(uint256 _tokenId) internal override(ERC721, ERC721URIStorage) {
    ERC721URIStorage._burn(_tokenId);
  }

  function supportsInterface(bytes4 _interfaceId) public view virtual override(AccessControl, ERC721, ERC721Enumerable)
    returns (bool)
  {
    return super.supportsInterface(_interfaceId);
  }

  function tokenURI(uint256 _tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
    return ERC721URIStorage.tokenURI(_tokenId);
  }

  function safeMint(address to, uint256 tokenId) external onlyOperator whenNotPaused {
    _safeMint(to, tokenId);
  }

  function burn(uint256 _tokenId) external onlyOperator whenNotPaused {
    require(super._exists(_tokenId), "LEGIONNARE: TOKEN_ID_INVALID");
    _burn(_tokenId);
  }

  function setTokenURI(uint256 tokenId, string memory _tokenURI) external onlyOperator whenNotPaused {
    ERC721URIStorage._setTokenURI(tokenId, _tokenURI);
  }
}
