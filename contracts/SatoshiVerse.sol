//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// Sale contract
contract SatoshiVerse is ERC721Enumerable, Ownable, ReentrancyGuard {
  using Counters for Counters.Counter;
  using Strings for uint256;

  address gensisAddress = 0x261a2FeaA8DdCBBb3347Fa4409A26D41DC1827f8;
  address ooffAddress = 0x1d9545f79e40DC463da094d1eE138668670eeB19;
  
  uint256 public SV_MAX = 9999;
  uint256 public PURCHASE_LIMIT = 1;
  uint256 public PRICE = 70_000_000_000_000_000; // 0.07 ETH

  uint256 private _activeDateTime = 1636905600; // November 14th at 11:00 AM EST
  uint256 constant INTERVAL = 3600;

  string private _contractURI = "";
  string private _tokenBaseURI1 = "";
  string private _tokenBaseURI2 = "";
  string private _tokenBaseURI3 = "";
  string private _tokenBaseURI4 = "";
  string private _tokenBaseURI5 = "";
  string private _tokenBaseURI6 = "";

  mapping(address => mapping(string => uint256)) public tokensCount;

  Counters.Counter private _publicSV;

  constructor() ERC721("SatoshiVerse", "SV") {

  }

  function _daysSince() internal view returns (uint256) {
    unchecked {
      uint256 passedTime = (block.timestamp - _activeDateTime) / INTERVAL;
      if(passedTime <= 6) {
        return 1;
      } else if( passedTime <= 24) {
        return 2;
      } else if( passedTime <= 48 ) {
        return 3;
      } else if( passedTime <=72 ) {
        return 4;
      } else{
        return 5;
      }
    }
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

  function getPurchaseLimit() external returns(uint256) {
    
  }

  function setMaxLimit(uint256 maxLimit) external onlyOwner {
    SV_MAX = maxLimit;
  }

  function gift(address to, uint256 numberOfTokens) external onlyOwner {
    for (uint256 i = 0; i < numberOfTokens; i++) {
      uint256 tokenId = _publicSV.current();

      if (_publicSV.current() < SV_MAX) {
        _publicSV.increment();
        _safeMint(to, tokenId);
      }
    }
  }

  function max(uint a, uint b) private pure returns (uint) {
    return a > b ? a : b;
  }

  function seed(address user, string memory tokenType, uint256 count) external onlyOwner {
    require(msg.sender != address(0), "Invalid user address");
    tokensCount[user][tokenType] += count;
  }

  function claim1(uint256 claimedCount) external nonReentrant {
    require(block.timestamp >= _activeDateTime, "Distribution doesn't start yet");
    require(block.timestamp <= _activeDateTime + 86400 * 7, "Distribution is ended");

    uint256 passedDays = _daysSince();

    uint256 genesisTokenCount = tokensCount[msg.sender]['genesis'];
    uint256 platinumTokenCount = tokensCount[msg.sender]['platinum'];
    uint256 goldTokenCount = tokensCount[msg.sender]['gold'];
    uint256 silverTokenCount = tokensCount[msg.sender]['silver'];
    uint256 bronzeTokenCount = tokensCount[msg.sender]['bronze'];

    uint256 maxCount = max(genesisTokenCount + platinumTokenCount + goldTokenCount + silverTokenCount + bronzeTokenCount, claimedCount);
    uint256 i = 0;
    uint256 tokenId;

    while(i < maxCount) {
      if(genesisTokenCount > 0) {
        genesisTokenCount--;
      } else if (passedDays >= 2 && platinumTokenCount > 0) {
        platinumTokenCount--;
      } else if (passedDays >= 3 && goldTokenCount > 0) {
        goldTokenCount--;
      } else if (passedDays >= 4 && silverTokenCount > 0) {
        silverTokenCount--;
      } else if (passedDays >= 5 && bronzeTokenCount > 0) {
        bronzeTokenCount--;
      }
      tokenId = _publicSV.current();
      if (_publicSV.current() < SV_MAX) {
        _publicSV.increment();
        _safeMint(msg.sender, tokenId);
      }
      i++;
    }

    tokensCount[msg.sender]['genesis'] = genesisTokenCount;
    tokensCount[msg.sender]['platinum'] = platinumTokenCount;
    tokensCount[msg.sender]['gold'] = goldTokenCount;
    tokensCount[msg.sender]['silver'] = silverTokenCount;
    tokensCount[msg.sender]['bronze'] = bronzeTokenCount;
  }

  function claim(uint256 claimedCount) external nonReentrant {
    require(block.timestamp >= _activeDateTime, "Distribution doesn't start yet");
    require(block.timestamp <= _activeDateTime + 86400 * 7, "Distribution is ended");
    
    uint256 passedDays = _daysSince();
    IERC721Enumerable genesisToken = IERC721Enumerable(gensisAddress);
    IERC1155 ooffToken = IERC1155(ooffAddress);

    uint256 genesisTokenCount = genesisToken.balanceOf(msg.sender);
    uint256 platinumTokenCount = ooffToken.balanceOf(msg.sender, 1);
    uint256 goldTokenCount = ooffToken.balanceOf(msg.sender, 4);
    uint256 silverTokenCount = ooffToken.balanceOf(msg.sender, 2);
    uint256 bronzeTokenCount = ooffToken.balanceOf(msg.sender, 3);

    uint256 maxCount = max(genesisTokenCount + platinumTokenCount + goldTokenCount + silverTokenCount + bronzeTokenCount, claimedCount);
    uint256 i = 0;
    uint256 tokenId;

    while(i < maxCount) {
      if(genesisToken.balanceOf(msg.sender) > 0) {
        tokenId = genesisToken.tokenOfOwnerByIndex(msg.sender, i);
        genesisToken.safeTransferFrom(msg.sender, address(this), tokenId);
      } else if (passedDays >= 2 && ooffToken.balanceOf(msg.sender, 1) > 0) {
        ooffToken.safeTransferFrom(msg.sender, address(this), 1, 1, "");
      } else if (passedDays >= 3 && ooffToken.balanceOf(msg.sender, 4) > 0) {
        ooffToken.safeTransferFrom(msg.sender, address(this), 4, 1, "");
      } else if (passedDays >= 4 && ooffToken.balanceOf(msg.sender, 2) > 0) {
        ooffToken.safeTransferFrom(msg.sender, address(this), 2, 1, "");
      } else if (passedDays >= 5 && ooffToken.balanceOf(msg.sender, 3) > 0) {
        ooffToken.safeTransferFrom(msg.sender, address(this), 3, 1, "");
      }

      tokenId = _publicSV.current();
      if (_publicSV.current() < SV_MAX) {
        _publicSV.increment();
        _safeMint(msg.sender, tokenId);
      }
      i++;
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