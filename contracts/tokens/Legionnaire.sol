//SPDX-License-Identifier: GNU General Public License v3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../utils/Operatorable.sol";
import "../helpers/StringHelper.sol";

// Sale contract
contract Legionnaire is ERC721Enumerable, ERC721URIStorage, Operatorable {
  // Token URI
  string public baseURI = "https://ipfs.io/ipfs/";

  constructor() ERC721("Satoshi's Legions - The Legionnaires", "LEGIONNAIRES")
  {

  }

  /**
    * @dev Set `baseURI`
    * Only `owner` can call
    */
  function setBaseTokenURI(string memory _baseTokenURI) external onlyOperator {
    baseURI = _baseTokenURI;
  }

  function _baseURI() internal view override returns (string memory) {
    return baseURI;
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

  function supportsInterface(bytes4 _interfaceId) public view virtual override(AccessControl, ERC721, ERC721Enumerable)
    returns (bool)
  {
    return super.supportsInterface(_interfaceId);
  }

  function tokenURI(uint256 _tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
    string memory _tokenURI = ERC721URIStorage.tokenURI(_tokenId);
    uint256 lastPosition = bytes(_tokenURI).length;
    string memory lastPrefix = StringHelper.substring(_tokenURI, lastPosition - 11, lastPosition); 
    if(StringHelper.compareStrings(lastPrefix, "placeholder")) {
      return "https://ipfs.io/ipfs/placeholder";
    } else {
      return _tokenURI;
    }
  }

  function safeMint(address to, uint256 tokenId) external onlyOperator {
    _safeMint(to, tokenId);
  }

  function burn(uint256 _tokenId) external onlyOperator {
    require(super._exists(_tokenId), "LEGIONNARE BURN: TOKEN_ID_INVALID");
    _burn(_tokenId);
  }

  function setTokenURI(uint256 tokenId, string memory _tokenURI) external onlyOperator {
    ERC721URIStorage._setTokenURI(tokenId, _tokenURI);
  }
}
