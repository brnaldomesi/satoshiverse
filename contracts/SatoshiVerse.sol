//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract SatoshiVerse is ERC721Enumerable, Ownable {
  using Counters for Counters.Counter;
  using Strings for uint256;

  address payable private _PaymentAddress =
    payable(0x7e0226d51654111E228D1cF85D7fF9Db1794D969);
  address payable private _DevAddress;

  uint256 public GLX_MAX = 10157;
  uint256 public PURCHASE_LIMIT = 30;
  uint256 public PRICE = 70_000_000_000_000_000; // 0.07 ETH

  uint256 private _activeDateTime = 1632600000; // September 25, 2021 8:00:00 PM
  string private _contractURI = "";
  string private _tokenBaseURI1 = "";
  string private _tokenBaseURI2 = "";
  string private _tokenBaseURI3 = "";
  string private _tokenBaseURI4 = "";
  string private _tokenBaseURI5 = "";
  string private _tokenBaseURI6 = "";

  Counters.Counter private _publicGLX;

  constructor() ERC721("Galaxer", "GLX") {
    _DevAddress = payable(msg.sender);
  }

  function setPaymentAddress(address paymentAddress) external onlyOwner {
    _PaymentAddress = payable(paymentAddress);
  }

  function setActiveDateTime(uint256 activeDateTime) external onlyOwner {
    _activeDateTime = activeDateTime;
  }

  function setContractURI(string memory URI) external onlyOwner {
    _contractURI = URI;
  }

  function setBaseURI(
    string memory URI1,
    string memory URI2,
    string memory URI3,
    string memory URI4,
    string memory URI5,
    string memory URI6
  ) external onlyOwner {
    if (bytes(URI1).length != 0) _tokenBaseURI1 = URI1;
    if (bytes(URI2).length != 0) _tokenBaseURI2 = URI2;
    if (bytes(URI3).length != 0) _tokenBaseURI3 = URI3;
    if (bytes(URI4).length != 0) _tokenBaseURI4 = URI4;
    if (bytes(URI5).length != 0) _tokenBaseURI5 = URI5;
    if (bytes(URI6).length != 0) _tokenBaseURI6 = URI6;
  }

  function setMintPrice(uint256 mintPrice) external onlyOwner {
    PRICE = mintPrice;
  }

  function setPurchaseLimit(uint256 purchaseLimit) external onlyOwner {
    PURCHASE_LIMIT = purchaseLimit;
  }

  function setMaxLimit(uint256 maxLimit) external onlyOwner {
    GLX_MAX = maxLimit;
  }

  function gift(address to, uint256 numberOfTokens) external onlyOwner {
    for (uint256 i = 0; i < numberOfTokens; i++) {
      uint256 tokenId = _publicGLX.current();

      if (_publicGLX.current() < GLX_MAX) {
        _publicGLX.increment();
        _safeMint(to, tokenId);
      }
    }
  }

  function purchase(uint256 numberOfTokens) external payable {
    require(
      numberOfTokens <= PURCHASE_LIMIT,
      "Can only mint up to purchase limit"
    );

    require(
      _publicGLX.current() < GLX_MAX,
      "Purchase would exceed GLX_MAX"
    );

    if (msg.sender != owner()) {
      require(
        block.timestamp > _activeDateTime,
        "Contract is not active"
      );
      require(
        PRICE * numberOfTokens <= msg.value,
        "ETH amount is not sufficient"
      );


      uint256 feeAmount = (msg.value * 5) / 100;
      _DevAddress.transfer(feeAmount);
      _PaymentAddress.transfer(msg.value - feeAmount);
    }


    for (uint256 i = 0; i < numberOfTokens; i++) {
      uint256 tokenId = _publicGLX.current();


      if (_publicGLX.current() < GLX_MAX) {
        _publicGLX.increment();
        _safeMint(msg.sender, tokenId);
      }
    }
  }

  function contractURI() public view returns (string memory) {
    return _contractURI;
  }

  function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721)
    returns (string memory)
  {
    require(_exists(tokenId), "Token does not exist");

    if (tokenId >= 0 && tokenId < 5000) {
      return string(abi.encodePacked(_tokenBaseURI1, tokenId.toString()));
    } else if (tokenId >= 5000 && tokenId < 10000) {
      return string(abi.encodePacked(_tokenBaseURI2, tokenId.toString()));
    } else if (tokenId >= 10000 && tokenId < 15000) {
      return string(abi.encodePacked(_tokenBaseURI3, tokenId.toString()));
    } else if (tokenId >= 15000 && tokenId < 20000) {
      return string(abi.encodePacked(_tokenBaseURI4, tokenId.toString()));
    } else if (tokenId >= 20000 && tokenId < 25000) {
      return string(abi.encodePacked(_tokenBaseURI5, tokenId.toString()));
    } else if (tokenId >= 25000 && tokenId < 30000) {
      return string(abi.encodePacked(_tokenBaseURI6, tokenId.toString()));
    }

    return "";
  }

  function withdraw() external onlyOwner {
    uint256 balance = address(this).balance;

    payable(msg.sender).transfer(balance);
  }
}