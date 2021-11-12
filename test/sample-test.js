const { expect } = require("chai");
const { ethers } = require("hardhat");
const { BigNumber } = require('ethers');

const oneLink = BigNumber.from(10).pow(18);

const chainlinkConf = {
  rinkeby: {
    vrfCoordinator: '0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B',
    link: '0x01BE23585060835E02B77ef475b0Cc51aA1e0709',
    keyHash: '0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311',
    fee: oneLink.div(10) // 0.1 LINK
  }
}

describe("SatoshiVerse", function () {
  const dateTime = new Date(1636905600000); // November 14th at 11:00 AM EST

  before(async function() {
    const [, alice, bob] = await ethers.getSigners();
    this.alice = alice;
    this.bob = bob;

    const Legionnaire = await ethers.getContractFactory("Legionnaire");
    this.legionnaire = await Legionnaire.deploy();
    await this.legionnaire.deployed();

    const SatoshiVerse = await ethers.getContractFactory("SatoshiVerse");
    this.satoshiVerse = await SatoshiVerse.deploy(
      this.legionnaire.address,
      chainlinkConf.rinkeby.vrfCoordinator,
      chainlinkConf.rinkeby.link,
      chainlinkConf.rinkeby.keyHash,
      chainlinkConf.rinkeby.fee
    );
    await this.satoshiVerse.deployed();
    
    await this.satoshiVerse.seedPresaleWhiteList([this.alice.address, this.bob.address], 'genesis', [250,50]);
    await this.satoshiVerse.seedPresaleWhiteList([this.alice.address, this.bob.address], 'platinum', [250,50]);
    await this.satoshiVerse.seedPresaleWhiteList([this.alice.address, this.bob.address], 'gold', [250,50]);
    await this.satoshiVerse.seedPresaleWhiteList([this.alice.address, this.bob.address], 'silver', [250,50]);

    await this.satoshiVerse.seedPublicWhiteList([this.alice.address, this.bob.address], [2, 1]);

    await this.satoshiVerse.setActiveDateTime(1636905600); // November 14th at 11:00 AM EST
  });

  // describe('Operator', function() {
  //   it('addOperator()', async function() {
  //     await this.legionnaire.addOperator(this.satoshiVerse.address);
  //     expect(await this.legionnaire.isOperator(this.satoshiVerse.address)).to.be.true;
  //   });
  //   it('removeOperator()', async function() {
  //     await this.legionnaire.removeOperator(this.satoshiVerse.address);
  //     expect(await this.legionnaire.isOperator(this.satoshiVerse.address)).to.be.false;
  //   });
  //   describe('reverts if', function() {
  //     it('non-owner call', async function() {
  //       await expect(this.legionnaire.connect(this.alice).addOperator(this.bob.address))
  //         .to.be.revertedWith('Ownable: caller is not the owner');
  //     });
  //   });
  // });

  describe('Custom test', function () {
    it("Test", async function() {
      dateTime.setTime(1637506800000) // November 21th at 10:00 AM EST
      await network.provider.request({
        method: "evm_setNextBlockTimestamp",
        params: [Math.round(dateTime.getTime() / 1000)]
      });

      await this.legionnaire.addOperator(this.satoshiVerse.address);

      let tokenIds = [...Array(700).keys()];
      tokenIds = tokenIds.map(n => n+1);
      
      let tokenURIs = Array.apply(null, Array(700)).map(function (x, i) { return (i+1).toString(); })

      await this.satoshiVerse.connect(this.alice).claim(700);
      expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(700);

      await this.satoshiVerse.startReveal();
      await this.satoshiVerse.setBatchTokenURIs(tokenIds, tokenURIs);

      const tokenURI = await this.legionnaire.connect(this.alice.address).tokenURI(1);
      console.log("tokenURI: ", tokenURI);
    })
  })

  // describe('Pausability', function() {
  //   it('pause()', async function() {
  //     await this.satoshiVerse.pause();
  //     expect(await this.satoshiVerse.paused()).to.be.true;
  //   });
  //   it('unpause()', async function() {
  //     await this.satoshiVerse.unpause();
  //     expect(await this.satoshiVerse.paused()).to.be.false;
  //   });
  //   describe('reverts if', async function() {
  //     it('non-owner call', async function() {
  //       await expect(this.satoshiVerse.connect(this.alice).pause())
  //         .to.be.revertedWith('Ownable: caller is not the owner');
  //     });
  //   });
  // });

  // describe("Claim and Purchase", function() {
  //   it("Purchase", async function() {
  //     dateTime.setTime(1637168400000); // November 17th at 12:00 PM EST
  //     await network.provider.request({
  //       method: "evm_setNextBlockTimestamp",
  //       params: [Math.round(dateTime.getTime() / 1000)]
  //     });

  //     await expect(this.satoshiVerse.connect(this.alice).purchase(1, { value: ethers.utils.parseEther("0.1") }))
  //      .to.be.revertedWith('Operatorable: CALLER_NO_OPERATOR_ROLE');

  //     await this.legionnaire.addOperator(this.satoshiVerse.address);

  //     await this.satoshiVerse.connect(this.alice).purchase(1, { value: ethers.utils.parseEther("0.1") });
  //     expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(1);

  //     await expect(this.satoshiVerse.purchase(2, { value: ethers.utils.parseEther("0.2") })).to.revertedWith("Not allowed to purchase");

  //     await this.satoshiVerse.connect(this.alice).purchase(5, { value: ethers.utils.parseEther("0.5") });
  //     expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(2);

  //     await expect(this.satoshiVerse.connect(this.alice).purchase(2, { value: ethers.utils.parseEther("0.1") })).to.revertedWith("Not enough ether");

  //     dateTime.setTime(1637254800000); // November 18th at 12:00 PM EST
  //     await network.provider.request({
  //       method: "evm_setNextBlockTimestamp",
  //       params: [Math.round(dateTime.getTime() / 1000)]
  //     });

  //     //await this.satoshiVerse.connect(this.alice).purchase(5, { value: ethers.utils.parseEther("0.7") });
  //     //expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(7);
  //   });

  //   it("Claim", async function() {
  //     dateTime.setTime(1637506800000) // November 21th at 10:00 AM EST
  //     await network.provider.request({
  //       method: "evm_setNextBlockTimestamp",
  //       params: [Math.round(dateTime.getTime() / 1000)]
  //     });
  //     await this.satoshiVerse.connect(this.alice).claim(18);
  //     expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(25);
  //     expect(await this.satoshiVerse.tokensCount(this.alice.address, 'silver')).to.equal(2);
  //   });

  //   it("Claim and purchase after reveal", async function() {
  //     await this.satoshiVerse.connect(this.alice).claim(1);
  //     expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(26);
  //     expect(await this.satoshiVerse.tokensCount(this.alice.address, 'silver')).to.equal(1);
  //     await this.satoshiVerse.connect(this.alice).purchase(4, { value: ethers.utils.parseEther("0.4") });
  //     expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(30);
  //   });

  //   it("setBatchTokenURIs", async function() {
  //     let tokenIds = [...Array(100).keys()];
  //     let tokenURIs = Array.apply(null, Array(100)).map(function (x, i) { return i.toString(); })
      
  //     await this.satoshiVerse.setBatchTokenURIs(tokenIds, tokenURIs);
  //   })
  // });
});
