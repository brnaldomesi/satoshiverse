const { use, expect } = require("chai");
const { ethers } = require("hardhat");
const {waffleChai} = require('@ethereum-waffle/chai');
const {deployMockContract} = require('@ethereum-waffle/mock-contract');

const IERC721Ennumerable = require('../artifacts/@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol/IERC721Enumerable.json');
const IERC1155 = require('../artifacts/@openzeppelin/contracts/token/ERC1155/IERC1155.sol/IERC1155.json');

use(waffleChai);

describe("SatoshiVerse", function () {
  before(async function() {
    const SatoshiVerse = await ethers.getContractFactory("SatoshiVerse");
    this.satoshiVerse = await SatoshiVerse.deploy();
    await this.satoshiVerse.deployed();

    const [owner, user] = await ethers.getSigners();
    this.owner = owner;
    this.user = user;

    this.genesis = await deployMockContract(user, IERC721Ennumerable.abi);
    this.mockIERC1155 = await deployMockContract(user, IERC1155.abi);

    await this.genesis.mock.balanceOf.withArgs(user.address).returns(5);
    await this.mockIERC1155.mock.balanceOf.withArgs(user.address, 1).returns(5);
    await this.mockIERC1155.mock.balanceOf.withArgs(user.address, 2).returns(5);
    await this.mockIERC1155.mock.balanceOf.withArgs(user.address, 3).returns(5);
    await this.mockIERC1155.mock.balanceOf.withArgs(user.address, 4).returns(5);

    await this.genesis.mock.tokenOfOwnerByIndex.withArgs(user.address, 0).returns(1);
    await this.genesis.mock.tokenOfOwnerByIndex.withArgs(user.address, 1).returns(2);
    await this.genesis.mock.tokenOfOwnerByIndex.withArgs(user.address, 2).returns(3);
    await this.genesis.mock.tokenOfOwnerByIndex.withArgs(user.address, 3).returns(4);
    await this.genesis.mock.tokenOfOwnerByIndex.withArgs(user.address, 4).returns(5);

    const emptyBytesData = ethers.utils.formatBytes32String("");

    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 1, emptyBytesData).returns();
    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 2, emptyBytesData).returns();
    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 3, emptyBytesData).returns();
    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 4, emptyBytesData).returns();
    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 5, emptyBytesData).returns();

    await this.mockIERC1155.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 1, 1, emptyBytesData).returns();
    await this.mockIERC1155.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 2, 1, emptyBytesData).returns();
    await this.mockIERC1155.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 3, 1, emptyBytesData).returns();
    await this.mockIERC1155.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 4, 1, emptyBytesData).returns();
  });

  describe("Claim", () => {
    it("check balance", async () => {
      
    });
  });
});
