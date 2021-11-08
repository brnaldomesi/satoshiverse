//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
import "./tokens/Legionnaire.sol";
import "./lib/Operatorable.sol";

// Sale contract
contract SatoshiVerse is VRFConsumerBase, Operatorable, ReentrancyGuard {
  Legionnaire public immutable legionnaire;

  address payable svEthAddr = payable(0x981268bF660454e24DBEa9020D57C2504a538C57);
  
  uint8 calledTimesForTokenURI;

  uint16[] publicRandomArr;
  uint16[] presaleRandomArr;
  uint16 _preSaleSV = 1;
  uint16 _publicSV = 5001;

  uint16[] tokenIdsForBatch;
  string[] ipfsURIsForBatch;

  uint256 public SV_MAX = 10000;
  uint256 private _activeDateTime = 1636905600; // November 14th at 11:00 AM EST
  uint256 INTERVAL = 3600;
  uint256 randNonce;
  
  // Chainlink
  uint256 internal fee;
  bytes32 internal keyHash;
  
  bool revealState;

  bytes32 requestId;

  mapping(address => mapping(string => uint8)) public tokensCount;
  mapping(address => uint8) public purchaseLimit;
  
  constructor(
    address _legionnaire,
    address _vrfCoordinator,
    address _link,
    bytes32 _keyHash,
    uint256 _fee
  ) 
    VRFConsumerBase(_vrfCoordinator, _link)
  {
    keyHash = _keyHash;
    fee = _fee;

    legionnaire = Legionnaire(_legionnaire);
  }

  function _daysSince() internal view returns (uint256) {
    unchecked {
      uint256 passedTime = (block.timestamp - _activeDateTime) / INTERVAL;
      if(passedTime <= 6) {
        return 0;
      } else if( passedTime <= 24) {
        return 1;
      } else if( passedTime <= 48 ) {
        return 2;
      } else if( passedTime <=72 ) {
        return 3;
      } else if( passedTime <= 96 ) {
        return 4;
      } else if( passedTime <= 120 ) {
        return 5;
      } else if( passedTime <= 144 ) {
        return 6;
      } else if( passedTime <= 168 ) {
        return 7;
      } else {
        return 8;
      }
    }
  }

  function min(uint a, uint b) private pure returns (uint) {
    return a < b ? a : b;
  }

  function seedPresaleWhiteList(address[] calldata users, string calldata tokenType, uint8[] calldata counts) external onlyOperator {
    require(msg.sender != address(0), "Invalid user address");
    require(users.length == counts.length, "Mismatched presale addresses and counts");

    for(uint256 i = 0; i < users.length; i++) {
      tokensCount[users[i]][tokenType] += counts[i];
    }
  }

  function seedPublicWhiteList(address[] calldata users, uint8[] calldata counts) external onlyOperator {
    require(msg.sender != address(0), "Invalid user address");
    require(users.length == counts.length, "Mismatched public addresses and counts");

    for(uint256 i = 0; i < users.length; i++) {
      purchaseLimit[users[i]] += counts[i];
    }
  }

  function claim(uint256 claimedCount) external whenNotPaused nonReentrant {
    require(block.timestamp >= _activeDateTime, "Presale not start yet");
    
    uint8 genesisTokenCount = tokensCount[msg.sender]['genesis'];
    uint8 platinumTokenCount = tokensCount[msg.sender]['platinum'];
    uint8 goldTokenCount = tokensCount[msg.sender]['gold'];
    uint8 silverTokenCount = tokensCount[msg.sender]['silver'];

    uint256 passedDays = _daysSince();

    uint256 minCount = min(genesisTokenCount + platinumTokenCount + goldTokenCount + silverTokenCount, claimedCount);
    uint256 i = 0;
    uint256 tokenId;

    while(i < minCount) {
      if(genesisTokenCount > 0) {
        genesisTokenCount--;
      } else if (passedDays >= 1 && platinumTokenCount > 0) {
        platinumTokenCount--;
      } else if (passedDays >= 2 && goldTokenCount > 0) {
        goldTokenCount--;
      } else if (passedDays >= 3 && silverTokenCount > 0) {
        silverTokenCount--;
      }

      if(revealState) {
        uint256 randomIndex = getRandomIndex(presaleRandomArr.length);
        tokenId = presaleRandomArr[randomIndex];
        presaleRandomArr[randomIndex] = presaleRandomArr[presaleRandomArr.length - 1];
        presaleRandomArr.pop();
      } else {
        tokenId = _preSaleSV;
        require(tokenId <= SV_MAX / 2, "No legionnaires left for presale");
        _preSaleSV++;
      }
      
      legionnaire.safeMint(msg.sender, tokenId);
      i++;
    }

    tokensCount[msg.sender]['genesis'] = genesisTokenCount;
    tokensCount[msg.sender]['platinum'] = platinumTokenCount;
    tokensCount[msg.sender]['gold'] = goldTokenCount;
    tokensCount[msg.sender]['silver'] = silverTokenCount;
  }

  function purchase(uint256 count) external payable whenNotPaused nonReentrant {
    require(block.timestamp >= _activeDateTime, "Sale not start yet");
    uint256 passedDays = _daysSince();
    require(passedDays > 3, "Public sale not start yet");
    require(msg.value >= count * .1 ether, "Not enough ether");
    
    uint256 limit; 
    if(passedDays < 5) {
      limit = purchaseLimit[msg.sender];
      require(limit > 0 && limit < 3, "Not allowed to purchase");
      
      if(count < limit) {
        purchaseLimit[msg.sender] -= uint8(count);
        limit = count;
      } else {
        purchaseLimit[msg.sender] = 0;
      }
    } else {
      limit = count;
    }

    uint256 tokenId;
    for (uint256 i = 0; i < limit; i++) {
      if(revealState) {
        uint256 randomIndex = getRandomIndex(publicRandomArr.length);
        tokenId = publicRandomArr[randomIndex];
        publicRandomArr[randomIndex] = publicRandomArr[publicRandomArr.length - 1];
        publicRandomArr.pop();
      } else {
        tokenId = _publicSV;
        require(tokenId <= SV_MAX, "No legionnaires left for public sale");
        _publicSV++;
      }
      
      legionnaire.safeMint(msg.sender, tokenId);
    }

    (bool sent, ) = svEthAddr.call{ value: limit * .1 ether }("");
    require(sent, "Failed to send Ether");

    if(msg.value > count * .1 ether) {
      (sent, ) = payable(msg.sender).call{ value: msg.value - limit * .1 ether }("");
      require(sent, "Failed to send change back to user");
    }
  }

  function setActiveDateTime(uint256 activeDateTime) external onlyOwner {
    _activeDateTime = activeDateTime;
  }

  function setInterval(uint256 interval) external onlyOwner {
    INTERVAL = interval;
  }

  function startReveal() external onlyOwner {
    uint16 i;
    for(i = _preSaleSV; i < SV_MAX / 2 + 1; i++) {
      presaleRandomArr.push(i);
    }

    for(i = _publicSV ; i < SV_MAX + 1; i++) {
      publicRandomArr.push(i);
    }
    
    revealState = true;
  }

  function getRandomIndex(uint256 range) internal returns(uint256) {
    randNonce++;
    return uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % range;
  }

  function setBatchTokenURIs(uint16[] memory _tokenIds, string[] memory _tokenURIs) external onlyOperator {
    require(revealState, "Have to reveal");

    calledTimesForTokenURI++;
    require(calledTimesForTokenURI < 3, "Immutable");
    require(_tokenIds.length == _tokenURIs.length, "Mismatched ids and URIs");
    require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");

    delete tokenIdsForBatch;
    delete ipfsURIsForBatch;

    for(uint256 i = 0; i < _tokenIds.length; i++) {
      tokenIdsForBatch.push(_tokenIds[i]);
      ipfsURIsForBatch.push(_tokenURIs[i]);
    }

    requestId = requestRandomness(keyHash, fee);
  }

  function fulfillRandomness(bytes32 _requestId, uint256 _randomness) internal override {
    if(requestId == _requestId) {
      randNonce++;
      while(tokenIdsForBatch.length > 0) {
        uint256 length = tokenIdsForBatch.length;
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce, _randomness))) % length;
        legionnaire.setTokenURI(tokenIdsForBatch[length - 1], ipfsURIsForBatch[randomIndex]);

        ipfsURIsForBatch[randomIndex] = ipfsURIsForBatch[length - 1];
        tokenIdsForBatch.pop();
        ipfsURIsForBatch.pop();
      }
    }
  }
}
