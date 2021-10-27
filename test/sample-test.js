const { use } = require("chai");
const { ethers, network } = require("hardhat");
const { waffleChai } = require('@ethereum-waffle/chai');
const { deployMockContract } = require('@ethereum-waffle/mock-contract');
const { expect } = require('chai');

const IERC721Ennumerable = require('../artifacts/@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol/IERC721Enumerable.json');
const IERC1155 = require('../artifacts/@openzeppelin/contracts/token/ERC1155/IERC1155.sol/IERC1155.json');

use(waffleChai);

describe("SatoshiVerse", function () {
  const dateTime = new Date(1636905600000); // November 14th at 11:00 AM EST

  before(async function() {
    const [owner, user] = await ethers.getSigners();
    this.owner = owner;
    this.user = user;

    this.genesis = await deployMockContract(user, IERC721Ennumerable.abi);
    this.mockIERC1155 = await deployMockContract(user, IERC1155.abi);

    const SatoshiVerse = await ethers.getContractFactory("SatoshiVerse");
    this.satoshiVerse = await SatoshiVerse.deploy(this.genesis.address, this.mockIERC1155.address);
    await this.satoshiVerse.deployed();

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

    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 1, '0x').returns();
    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 2, '0x').returns();
    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 3, '0x').returns();
    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 4, '0x').returns();
    await this.genesis.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 5, '0x').returns();

    await this.mockIERC1155.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 1, 1, '0x').returns();
    await this.mockIERC1155.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 2, 1, '0x').returns();
    await this.mockIERC1155.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 3, 1, '0x').returns();
    await this.mockIERC1155.mock.safeTransferFrom.withArgs(user.address, this.satoshiVerse.address, 4, 1, '0x').returns();
  });

  describe("Claim", function() {
    // it("check claim and query method", async function() {
    //   dateTime.setTime(1637168400000);
    //   await network.provider.request({
    //     method: "evm_setNextBlockTimestamp",
    //     params: [Math.round(dateTime.getTime() / 1000 + 30)]
    //   });

    //   await this.satoshiVerse.connect(this.user).claim(30);
    //   expect(await this.satoshiVerse.balanceOf(this.user.address)).to.equal(25);
    // });
    
    it("check snapshot and whitelist method", async function() {
      await this.satoshiVerse.seed(this.user.address, 'genesis', 5);
      await this.satoshiVerse.seed(this.user.address, 'platinum', 5);
      await this.satoshiVerse.seed(this.user.address, 'gold', 5);
      await this.satoshiVerse.seed(this.user.address, 'silver', 5);
      await this.satoshiVerse.seed(this.user.address, 'bronze', 5);

      dateTime.setTime(1637168400000);
      await network.provider.request({
        method: "evm_setNextBlockTimestamp",
        params: [Math.round(dateTime.getTime() / 1000 + 30)]
      });

      await this.satoshiVerse.connect(this.user).claim1(24);
      expect(await this.satoshiVerse.balanceOf(this.user.address)).to.equal(24);
      expect(await this.satoshiVerse.tokensCount(this.user.address, 'bronze')).to.equal(1);
    });
  });
});
