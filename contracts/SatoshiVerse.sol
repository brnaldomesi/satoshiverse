//SPDX-License-Identifier: Unlicense



// Todo clean this up spaces. 
  // ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*,,,,,,,,,,,,&&&&&&&&&&&&&&&&(,,,,,,,,,,,/,,,,,,,,,,,,,****,,,,,,,,,,,,,,,,,,,.                                          
  // ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,**,,,,,,,,,,,,,,(,/****/**********,,,,,,,,,,,,,,,,,,,.                                          
  // ,,,,,,,,,,,,,,,,,,,,,,,**,,,,,*,,,,*,*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,#,/****/**//*//***,,,,,,,,,,,,,,,,,,,.                                          
  // ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*,,*,*,/,,,..............,,,,,,,,,,,,,,,,,,,,*/(,/****(/,(*//////*******************.                                          
  // ,,,,,,,,,,,,,,,,,,,,*,,,,*,,,**,,,,*./,,,. ............,,,,,,,,,,,,,,,,,,***/,******/(,(//*/*////*/,,,,,,,,,,,,,,,.                                          
  // ,,,,,,,,,,,,,,,,**,,,,,,,,,,,**,,,*, ,,,,,.  ..........,,,,,,,,,,,,,,,,,***,(,******/(,#//**/*///////,***,***,***,.                                          
  // ,,,,,,,,,,,,,,**,,,,,,,,,*,*,**,,,*,,  ,/**,...*......,,,,,,,,,,,,*,,**//#/,*//******(*(///////////((((,**********.                                          
  //  ,,,,,,,,,,,****,,,,,,,,,,,,*,**,,,,,,,,,,. ..*/,,,,**************/*/(*,,,/**/*******//,/*///*///////((##(*********,                                          
  // ,,,,,,,,,******,,,,,,,,,,,,*,*,,,,,,,.,,,,.....,,,,**.,/,**.,,******,**************//*,////////////(((###%,*******,                                          
  // ,,,,,,,********,*,,,,,,,*,,*,*,,,,,,,,,.....,,,.  ...,,/,**.,/,,******,,,,**********/**/**///**////(((###%%/******,                                          
  // ,,,,,,********,*,,,,,,,,*,*,/*,*,,,,,..  .,,.....,,,,,*/.*/.,/**,,,,,,************///**,///*//////((((####%%(*****,                                          
  // ,,,,,**/********,**,,,,,*,,,,,,,,,.,,,,,,,....,,,,...,*(,/*.,/,,*****,,,*******,***//,,/***///////((######%%#/****,                                          
  // ,,,,,**********,,**,,,****,,,,,*,,,,,,,,....,,**,,,****(,**,,(***,********,,****////(,(*///////////(((#####%%%****,                                          
  //  ***************,,***,,,****,,,,***,,...,,,,,,....,,*/**(,/*,,(//***,,,***********///(,/**/////(////(########%%(///*                                          
  // ***,///********,,,***,,,*****,,*,,******,,,,,****,,,,**/,/**,/,,,*********////******(,(//((////*//((########%%&///,                                          
  // ,,,,*//*********,,,,*****,,,*******,*********,********/(,/*,,(//****////***,,,**//(/(,(((///*//((((#######%%%%%(((*                                          
  // ***//*/************,,*****///*/*//****,,,*****,,,,***,//,/**,/*///***,,,**//((////*((*////((((((((((#######%%%%(//,                                          
  // *****,(******************,**(/(/*****//**,,,,**********(,/****/****////////****//(((#/(((((((///(((((######%%#%%//,                                          
  // ***/***/*/*/*//(((############%(##((((///////***/**(,#.,/*/,/(*///(///////((##%%%%&%&%&&&&&&&&&&&&&&&%%%###%#%%%((*                                          
  // ,,*&/**//*/((###%&&#%%%%%%%%%%%#(((((((((###/(#%,,,,//*******/**,,*/((#&%%#%#######%&&&&&&&&&&&&@&&&&&&%%%%%##&@(*,                                          
  // ,*&&&(*///((((#%%%(#*******///*//////(#%####(%,(******,******////((#%%%%%%%%%(////////////////(&&&&@&&&&%%%%#&&&@/,                                          
  //  *%&,#%/**(((/#/#/*(*%***************/////#%%#(((/*,,**********///(%%%%%&%#////////////////////@%%%&@&&%&&%%#%&%#&&,                                          
  //  **(,*&&**(##,********,#/***************/////%(/******************#%%%%%////////////////****(//%%%%%%%##&&%%%&&##&#,                                          
  // **//*/&&#,/,,(*//********,/#*,,,,,,,,**/#%//*//****,,,,,,,****//(%#%%%%&&@%(/////***,*/&/*/((((((#%%&%#%%#@@@&#%&#*                                          
  // /*#*#,(&/,,,,,**,*%,//*********************/******,,**********//(##%%%#%%%%%%*********///(//#%#(&/((/#####%@##@#&#*                                          
  // ,*#%**,#/,,,,,,,,,,*,,,,*##(***,,/,*((,.,*,*******,,,,,****,,,,*(###%%%%#%,*/((/****(*/#%#***///////((((#%%%###@%#,                                          
  // *(*%*(#&/*,,,,,,,,,,,,,,,,,,,,..    .,*,,*********************//###%%%////*/*,****,*************////((((##%@%%%%##,                                          
  // **/*(,(#**,,,,,,,,,,,,,,,,,,...   .,(,.*,,*****/***,,,,,,,,***//####%*,****/,*/*,,,,,,*,*******////((((##%#&&#%%%/*                                          
  // **(//(*******,,,,,,,,,,,,,,,,......,/,*,,,,,,********,*********/##%%//*,,,*,*//*,,,,,,*******////(((###%%%%%%&%%%#*                                          
  // ///((#*/*********,,,,,,,,,,,,,,,,,,./,,,**,****//**,,,,,,,*,,,*(#%%%///////*,****,,*********////((###%%%%%%&#%%%(/,                                          
  // ***((((#*#*********,,,,,,,,,,,,,,,,,*,,******///******,,,*/***/##%%(/****//(%/************///(((##%%%%%%%&%&%%%%/(*                                          
  // ****((((((/*#***************,,,,,,***#*//**(//(///**,,****,****(#%%////(/(((#///////////((((((##%%%%%%&%&%&%%%%(((*                                          
  // ****((((((((#*(////**********************,(/*/(//***,,,***,*/**#%%%((#/%(*//////////(((((###%%%%%%%%&%&&&&%%%%#///*                                          
  // ,,,,,(((((((((*(%%(**///*********************//(//****,***,****##%%#%////////////(((#((#%%%%&&%%&@&&&&&&&&%%%%/(((*                                          
  // ******(((((((#(/#//((**(%(***************,*****#//*////(//(((#/%#%%(////////////((((###%#@&%%%&&%&&&&&&&&%%%%/////,                                          
  // ******#(((((((#(#%//////////************,,,,****(//%#(/***/(#&&@%%&%//////////(((((%#%%%&%%&&%%&&&&&&&&&%%%%%/////,                                          
  // ,,,,,,,((((((((((#(///////#/*****%/*****,,,***(#/(#%&&%%%%%%&&@&&&&&(////////(((#@%#%%%%&%%%&&&&&&&&&&&&&%%%//////,                                          
  // /////////%(((((((((/(////*((******#&#/****#*,,,********(%(%%%%%%%%%%*//#((((((&&@%%%%%&&&%&&&&&&&&&&&&&&%&%///////,                                          
  // *********(##%(((((#(/%%*////********@&%&&&&&&&&&&&(&*********//%&&&&&&&@@@@&&@@%%%%%%%%%%%%&@@&&&&&&&%&%%%////////,                                          
  // ////////////#*%//%&&%%/////**********/@@@@@@@@@@@@@&/,,,,,,,**%@@@@@@@@@@@@@@&%%%%%%%%%%%%%&%&&@@&%&&#&%%/////////,                                          
  // ***********///////(%/#/////********,#/**,,,,,,,,,,,,,,,,,,,,,*******/////%%%%&&%%%%%%%%%%%&&&&&@&%%%%%%%//////////,                                          
  // ////////////*/*///////#//*************,,,,,,,,,,*///******///(((#((/////((((#%%%%%%%%%%%%%%%&&%%%%%%%%%///////////,                                          
  // ,,,,,,,,,,,,,//******/(//**********#*******(&&&&&&&&&&&&&&&&&&&&&&@@@@&&%##%%%%&%%%%%%%%%%%&%%%%%%%%%&*///////////,                                          
  // ,,,,,,,,,,,,,*(/******///**/%#(****%*&&&&%******,,. .,***********/////(%%&&@@@&&%%%&&@@%%%&%%%%%%%%%&(////////////,                                          
  // ,,,,,,,,,,,,,,(,(*******((/*****************,,,,,,,,,,,,,,,,,********/(######%#%%%%%%%%%&&&%%%%%%%&#%/////////////,                                          
  // ***************((,#*/***********************/////////****/////((#%%&&&%%%####%##%%%%%%%%%%%%%%%%&%&&//////////////,                                          
  // ***************//((/*(*///********************///((##%%&&&&&&&&&&%%%####(#((##%%%%%%%%%%%%%%%&#&&&&///////////////*                                          
  // ****************,((//#*/*#******************////////////((#(#((#%#&%####((#%%%%%%%%%%%%%%&%%%&&%&&****************,                                          
  // //////////////////((((((*(/,(*********************************//////((((#(######%%%%%%&#%%%&&&&&%(((((((((((((((((*                                          
  // ///////////////////##(((#*((#,#***********************/,***(***/////////(((((##%%%%%&%&&%%&&&&&#******************,                                          
  // /////////////////////##((#/#(((,#**************(/,,*,/,//((/,#**,/%(////(((((%#%%%%%&&&%%&&&&&////////////////////,                                          
  // ///////////////////////####*(/(//(,#*/*###/,,,/#,%(,#&&&&&#&&@*(*(#%//*/%%&&(#%&#&%&&&&%&&&&//////////////////////,                                          
  // ///////////////////////###%#*((/(////,,*##/,*/(((,(%%@*,,,**&@*%((/(((#(%&&#((&%&%%%&&&&&(((//////////////////////,                                          
  // ///////////////////////##(//%(%((///((/(/**(/*(#,,#@*//***/*(##(@/(/((/(#&#&&%&%%%&&&&#//(((//////////////////////,                                          
  // ///////////////////////##(((((%%#(#(((/*(((*@*&,/(@@#(****//((@@@/%(#%&#%#&%%&&&&&&&(/////((//////////////////////,                                          
  // ////////////////////////////////(&%####%(&/&,@@@@@(%/,/(####*(&(@@@@@@&&&&&&&&&&&&**********//////////////////////,                                          
  // ////////////////////////////////(#((@&&&&(%*%@@@@@#(%%%#**#%%&%@@@@@@@&&&@&@&&&(##/*********//////////////////////,                                          
  // ////////////////////////////////(#(((#(#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&%#((###/*********//////////////////////,                                          
  // ////////////////////////////////(#(((#(###%#%%&@@@@@@@@@@@@@@@@@@@@&&##%%##%#((###/*********//////////////////////,   



/*
* Gas optimization 
*
*
*
*
*
*/ 
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
  
  uint256 private _activeDateTime = 1637384400; // November 20th at 11:00 AM EST
  uint256 INTERVAL = 3600;
  uint256 randNonce;
  
  // Chainlink
  uint256 internal fee;
  bytes32 internal keyHash;
  
  bool revealState;

  bytes32 requestId;

  mapping(address => mapping(string => uint8)) public tokensCount;
  mapping(address => uint8) public purchaseLimit;

  uint256 public _remainingPresaleSV = 5000;
  mapping(uint256 => uint256) public cachePresaleSV;

  uint256 public _remainingPublicSV = 5000;
  mapping(uint256 => uint256) public cachePublicSV;

  uint256 randomness;
  string constant baseURI = "https://ipfs.io/ipfs/Qme7ss3ARVgxv6rXqVPiikMJ8u2NLgmgszg13pYrDKEoiu/legionnaires/";
  
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

    /**
    * 
    */
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

   /**
    * 
    * potentially Add contract address for BitcoinAngel , ArtVaTar for whitelist , might be on the dapp
    * f out the purchase limit when the user
    */
 
  function seedPublicWhiteList(address[] calldata users, uint8[] calldata counts) external onlyOperator {
    require(msg.sender != address(0), "Invalid user address");
    require(users.length == counts.length, "Mismatched public addresses and counts");

    for(uint256 i = 0; i < users.length; i++) {
      purchaseLimit[users[i]] += counts[i];
    }
  }

    /**
    * User Claims their Legionnaire based on their holding
    * TODOs
    * 
    *
    */

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
    string memory tokenURI;

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

      /*if(revealState) {
        uint256 randomIndex = getRandomIndex(presaleRandomArr.length);
        tokenId = presaleRandomArr[randomIndex];
        presaleRandomArr[randomIndex] = presaleRandomArr[presaleRandomArr.length - 1];
        presaleRandomArr.pop();
      } else {
        tokenId = _preSaleSV;
        require(tokenId <= SV_MAX / 2, "No legionnaires left for presale");
        _preSaleSV++;
      }*/

      tokenId = _preSaleSV;
      require(tokenId <= SV_MAX / 2, "No legionnaires left for presale");
      _preSaleSV++;

      legionnaire.safeMint(msg.sender, tokenId);
      // if(revealState) {
        tokenURI = string(abi.encodePacked(baseURI, uint2str(drawIndexPresale())));
        legionnaire.setTokenURI(tokenId, tokenURI);
      // }

      i++;
    }

    tokensCount[msg.sender]['genesis'] = genesisTokenCount;
    tokensCount[msg.sender]['platinum'] = platinumTokenCount;
    tokensCount[msg.sender]['gold'] = goldTokenCount;
    tokensCount[msg.sender]['silver'] = silverTokenCount;
  }

  function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

   /**
    * TODO 
    * Add purchase limit of 2 legionnaires 
    * 
    */

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
    string memory tokenURI;

    for (uint256 i = 0; i < limit; i++) {
      /*if(revealState) {
        uint256 randomIndex = getRandomIndex(publicRandomArr.length);
        tokenId = publicRandomArr[randomIndex];
        publicRandomArr[randomIndex] = publicRandomArr[publicRandomArr.length - 1];
        publicRandomArr.pop();
      } else {
        tokenId = _publicSV;
        require(tokenId <= SV_MAX, "No legionnaires left for public sale");
        _publicSV++;
      }*/

      tokenId = _publicSV;
      require(tokenId <= SV_MAX, "No legionnaires left for public sale");
      _publicSV++;
      
      legionnaire.safeMint(msg.sender, tokenId);
      // if(revealState) {
        tokenURI = string(abi.encodePacked(baseURI, uint2str(drawIndexPublic())));
        legionnaire.setTokenURI(tokenId, tokenURI);
      // }
    }

    (bool sent, ) = svEthAddr.call{ value: limit * .1 ether }("");
    require(sent, "Failed to send Ether");

    if(msg.value > count * .1 ether) {
      (sent, ) = payable(msg.sender).call{ value: msg.value - limit * .1 ether }("");
      require(sent, "Failed to send change back to user");
    }
  }

   /**
    * 
    */
  function setActiveDateTime(uint256 activeDateTime) external onlyOwner {
    _activeDateTime = activeDateTime;
  }
   /**
    * 
    */
  function setInterval(uint256 interval) external onlyOwner {
    INTERVAL = interval;
  }

  
  /**
    * 
    */
  function drawIndexPresale() public returns (uint256) {
    //randNonce++;

    //RNG
    uint256 i = getRandomIndex(_remainingPresaleSV);
    //uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce, randomness))) % _remainingPresaleSV;

    // if there's a cache at cache[i] then use it
    // otherwise use i itself
    uint256 index = cachePresaleSV[i] == 0 ? i : cachePresaleSV[i];

    // grab a number from the tail
    cachePresaleSV[i] = cachePresaleSV[_remainingPresaleSV - 1] == 0 ? _remainingPresaleSV - 1 : cachePresaleSV[_remainingPresaleSV - 1];
    _remainingPresaleSV = _remainingPresaleSV - 1;

    //console.log("randomIndex: %d", index + 1);
    return index + 1;
  }

  /**
    * 
    */
  function drawIndexPublic() public returns (uint256) {
    //randNonce++;

    //RNG
    uint256 i = getRandomIndex(_remainingPublicSV);
    //uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce, randomness))) % _remainingPublicSV;

    // if there's a cache at cache[i] then use it
    // otherwise use i itself
    uint256 index = cachePublicSV[i] == 0 ? i : cachePublicSV[i];

    // grab a number from the tail
    cachePublicSV[i] = cachePublicSV[_remainingPublicSV - 1] == 0 ? _remainingPublicSV - 1 : cachePublicSV[_remainingPublicSV - 1];
    _remainingPublicSV = _remainingPublicSV - 1;

    //console.log("randomIndex: %d", index + (SV_MAX / 2 + 1));
    return index + (SV_MAX / 2 + 1);
  }


  function startReveal() external onlyOwner {
    /*uint16 i;
    for(i = _preSaleSV; i < SV_MAX / 2 + 1; i++) {
      presaleRandomArr.push(i);
    }

    for(i = _publicSV ; i < SV_MAX + 1; i++) {
      publicRandomArr.push(i);
    }*/
    
    //require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
    //requestId = requestRandomness(keyHash, fee);

    // revealState = true;
    // setBatchTokenURIs();
  }
   /**
    * 
    */
  function getRandomIndex(uint256 range) internal returns(uint256) {
    randNonce++;
    return uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce, randomness))) % range;
  }

  function safeBatchMint(address holder) external whenPaused onlyOperator {
    require(holder != address(0), "Invalid address to send");
    require(revealState, "Have to reveal");

    for(uint256 i = 0; i < publicRandomArr.length; i++) {
      legionnaire.safeMint(holder, publicRandomArr[i]);
    }

    _publicSV = 10001;
    delete publicRandomArr;
  }

  function setBatchTokenURIs(/*uint16[] memory _tokenIds, string[] memory _tokenURIs*/) external onlyOperator {
    //require(revealState, "Have to reveal");

    uint16 i;

    uint256 tokenId;
    string memory tokenURI;

    for(i = 1; i < _preSaleSV; i++) {
      tokenId = i;
      tokenURI = string(abi.encodePacked(baseURI, uint2str(drawIndexPublic())));
      legionnaire.setTokenURI(tokenId, tokenURI);
    }

    for(i = 5001; i < _publicSV; i++) {
      tokenId = i;
      tokenURI = string(abi.encodePacked(baseURI, uint2str(drawIndexPublic())));
      legionnaire.setTokenURI(tokenId, tokenURI);
    }

    //calledTimesForTokenURI++;

    /*require(calledTimesForTokenURI < 3, "Immutable");
    require(_tokenIds.length == _tokenURIs.length, "Mismatched ids and URIs");
    require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");

    delete tokenIdsForBatch;
    delete ipfsURIsForBatch;

    for(uint256 i = 0; i < _tokenIds.length; i++) {
      tokenIdsForBatch.push(_tokenIds[i]);
      ipfsURIsForBatch.push(_tokenURIs[i]);
    }

    requestId = requestRandomness(keyHash, fee);*/
  }

  function fulfillRandomness(bytes32 _requestId, uint256 _randomness) internal override {
    if(requestId == _requestId) {
      randomness = _randomness;

      /*randNonce++;
      while(tokenIdsForBatch.length > 0) {
        uint256 length = tokenIdsForBatch.length;
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce, _randomness))) % length;
        legionnaire.setTokenURI(tokenIdsForBatch[length - 1], ipfsURIsForBatch[randomIndex]);

        ipfsURIsForBatch[randomIndex] = ipfsURIsForBatch[length - 1];
        tokenIdsForBatch.pop();
        ipfsURIsForBatch.pop();
      }*/
    }
  }
}
