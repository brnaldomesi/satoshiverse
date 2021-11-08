//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// Sale contract
contract Legionnaire is ERC721Enumerable, ERC721URIStorage {
  constructor() ERC721("SatoshiVerse", "SV") 
  {

  }

  function _baseURI() internal pure override returns (string memory) {
    return "https://ipfs.io/ipfs/";
  }

  function _beforeTokenTransfer(
    address _from,
    address _to,
    uint256 _tokenId
  ) internal override(ERC721, ERC721Enumerable) {
    ERC721Enumerable._beforeTokenTransfer(_from, _to, _tokenId);
  }

  function _burn(uint256 _tokenId) internal override(ERC721, ERC721URIStorage) {
    ERC721URIStorage._burn(_tokenId);
  }

  function supportsInterface(bytes4 _interfaceId) public view virtual override(ERC721, ERC721Enumerable)
    returns (bool)
  {
    return super.supportsInterface(_interfaceId);
  }

  function tokenURI(uint256 _tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
    return ERC721URIStorage.tokenURI(_tokenId);
  }

  function safeMint(address to, uint256 tokenId) external {
    _safeMint(to, tokenId);
  }

  function setTokenURI(uint256 tokenId, string memory _tokenURI) external {
    ERC721URIStorage._setTokenURI(tokenId, _tokenURI);
  }
}
