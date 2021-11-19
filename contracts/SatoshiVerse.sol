//SPDX-License-Identifier: GNU General Public License v3.0

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

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "./interfaces/ILegionnaire.sol";
import "./utils/Operatorable.sol";
import "./helpers/NumberHelper.sol";


 /**
    * 
    */
contract SatoshiVerse is VRFConsumerBase, Operatorable, ReentrancyGuard {
  ILegionnaire public legionnaire;

  address payable public svEthAddr = payable(0x981268bF660454e24DBEa9020D57C2504a538C57);
  
  uint16 _claimSV = 1;
  uint16 _purchaseSV = 3351;

  uint256 SV_MAX = 10000;
  
  uint256 _activeDateTime = 1637683200; // November 23th at 11:00 AM EST
  uint256 INTERVAL = 3600;
  uint256 randNonce;
  
  // Chainlink
  uint256 randomNess;
  uint256 internal fee;
  bytes32 internal keyHash;
  
  bool revealState;

  bool public claimState = true;
  bool public purchaseState = true;

  bytes32 requestId;

  string[] leftoverUris;

  mapping(address => mapping(string => uint8)) public tokensCount;
  mapping(address => uint8) public purchasedSoFar;
  
  constructor(
    address _operator,
    address _uriSetter,
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

    legionnaire = ILegionnaire(_legionnaire);

    addOperator(_operator);
    addURISetter(_uriSetter);
  }

    /**
    * 
    */

  function setPaymentAddress(address _svEthAddr) external onlyURISetter {
    svEthAddr = payable(_svEthAddr);
  }
 /**
    * 
    */
  function seedPresaleWhiteList(address[] calldata users, string calldata tokenType, uint8[] calldata counts) external onlyOperator {
    require(users.length == counts.length, "Mismatched presale addresses and counts");

    for(uint256 i = 0; i < users.length; i++) {
      tokensCount[users[i]][tokenType] += counts[i];
    }
  }

/**
*
*/
  function toggleClaim() external onlyOperator {
    claimState = !claimState;
  }

  function togglePurchase() external onlyOperator {
    purchaseState = !purchaseState;
  }


/* TODO 
* Make Public 
*
*
*
*/
  function popRandomTokenURI() internal returns(string memory) {
    uint256 randomIndex = getRandomIndex(leftoverUris.length);
    string memory tokenURI = leftoverUris[randomIndex];
    leftoverUris[randomIndex] = leftoverUris[leftoverUris.length - 1];
    leftoverUris.pop();
    return tokenURI;
  }

    /**
    * User Claims their Legionnaire based on their holding
    * TODOs
    * 
    *
    */
  function claim(uint256 claimedCount) external nonReentrant {
    require(claimState, "Claim is disabled");
    require(block.timestamp >= _activeDateTime, "Presale not start yet");
    
    uint8 genesisTokenCount = tokensCount[msg.sender]['genesis'];
    uint8 platinumTokenCount = tokensCount[msg.sender]['platinum'];
    uint8 goldTokenCount = tokensCount[msg.sender]['gold'];
    uint8 silverTokenCount = tokensCount[msg.sender]['silver'];

    uint256 passedDays = NumberHelper.daysSince(_activeDateTime, INTERVAL);

    uint256 minCount = NumberHelper.min(genesisTokenCount + platinumTokenCount + goldTokenCount + silverTokenCount, claimedCount);
    require(_claimSV + minCount <= 3351, "No legionnaires left for presale");

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

      if(revealState) {
        tokenURI = popRandomTokenURI();
      }

      tokenId = _claimSV;
      _claimSV++;
      
      legionnaire.safeMint(msg.sender, tokenId);
      if(!revealState) {
        legionnaire.setTokenURI(tokenId, "placeholder");
      } else {
        legionnaire.setTokenURI(tokenId, tokenURI);
      }
      i++;
    }

    tokensCount[msg.sender]['genesis'] = genesisTokenCount;
    tokensCount[msg.sender]['platinum'] = platinumTokenCount;
    tokensCount[msg.sender]['gold'] = goldTokenCount;
    tokensCount[msg.sender]['silver'] = silverTokenCount;
  }

   /**
    * 
    * 
    */

  function purchase(uint256 count) external payable nonReentrant {
    require(purchaseState, "Purchase is disabled");
    require(block.timestamp >= _activeDateTime, "Sale not start yet");
    uint256 passedDays = NumberHelper.daysSince(_activeDateTime, INTERVAL);
    require(passedDays > 3, "Public sale not start yet");
    require(msg.value >= count * .1 ether, "Not enough ether");
    
    uint256 limit; 
    if(passedDays < 5) {
      limit = purchasedSoFar[msg.sender];
      require(count + limit > 0 && count + limit < 3, "Not allowed to purchase that amount");
      purchasedSoFar[msg.sender] += uint8(count);
    } else if (passedDays < 6) {
      require(count < 11, "Up to 10 only");
    }

    limit = count;
    require(_purchaseSV + limit <= SV_MAX + 1, "No legionnaires left for public sale");

    uint256 tokenId;
    string memory tokenURI;


    for (uint256 i = 0; i < limit; i++) {
      if(revealState) {
        tokenURI = popRandomTokenURI();
      }

      tokenId = _purchaseSV;
      _purchaseSV++;
    
      legionnaire.safeMint(msg.sender, tokenId);
      if(!revealState) {
        legionnaire.setTokenURI(tokenId, "placeholder");
      } else {
        legionnaire.setTokenURI(tokenId, tokenURI);
      }
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
  function setActiveDateTime(uint256 activeDateTime) external onlyOperator {
    _activeDateTime = activeDateTime;
  }
   /**
    * 
    */
  function setInterval(uint256 interval) external onlyOperator {
    INTERVAL = interval;
  }

/** TODO
* Call this function 
* pushLeftOverUris -> 
* set to true, can only call URIs while it has not revealed yet
*
* A function for the Operator to start the period of time for the user to reveal the URI upon mint
*
*/ 

  function beginSelfRevealPeriod(string[] memory leftoverUris_) external onlyOperator {
    for(uint256 i = 0; i < leftoverUris_.length; i++) {
      leftoverUris.push(leftoverUris_[i]);
    }
    
    if(!revealState) {
      revealState = true;
    }
  }
   /**
    * 
    */
  function getRandomIndex(uint256 range) internal returns(uint256) {
    randNonce++;
    return uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce, randomNess))) % range;
  }

  function safeBatchMintAndTransfer(address holder, bool isSetUri, uint16 batchSize) external onlyOperator {
    require(revealState, "Have to begin Self-Reveal");
    require(_purchaseSV + batchSize <= SV_MAX + 1, "No legionnaires left for public sale");

    for(uint256 i = _purchaseSV; i < _purchaseSV + batchSize; i++) {
      legionnaire.safeMint(holder, i);
      if(isSetUri) {
        legionnaire.setTokenURI(i, "placeholder");
      }
    }

    _purchaseSV = uint16(_purchaseSV + batchSize);
  }
 /**
    * 
    */
  function pairLegionnairesWithUris(uint16[] memory _tokenIds, string[] memory _tokenURIs) external onlyURISetter {
    require(_tokenIds.length == _tokenURIs.length, "Mismatched ids and URIs");
    require(_tokenIds.length > 0, "Empty parameters");

    while(_tokenIds.length > 0) {
      uint256 length = _tokenIds.length;
      uint256 randomIndex = getRandomIndex(length);
      legionnaire.setTokenURI(_tokenIds[length - 1], _tokenURIs[randomIndex]);
      _tokenURIs[randomIndex] = _tokenURIs[length - 1];
      delete _tokenIds[length - 1];
      delete _tokenURIs[length - 1];

      assembly { mstore(_tokenIds, sub(mload(_tokenIds), 1)) }
      assembly { mstore(_tokenURIs, sub(mload(_tokenURIs), 1)) }
    }
  }
 /**
    * 
    */
  function fulfillRandomness(bytes32 _requestId, uint256 _randomness) internal override {
    if(requestId == _requestId) {
      randomNess = _randomness;
    }
  }
 /**
    * 
    */
  function setMaxLimit(uint256 maxLimit) external onlyOwner {
    require(maxLimit < 10001, "Exceed max limit 10000");
    SV_MAX = maxLimit;
  }
 /**
    * 
    */
  function requestRandomToVRF() external onlyOperator {
    require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
    requestId = requestRandomness(keyHash, fee);
  }
}
