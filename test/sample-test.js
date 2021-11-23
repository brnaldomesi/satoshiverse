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

describe("Satoshiverse", function () {
  const dateTime = new Date(1636905600000); // November 14th at 11:00 AM EST

  before(async function() {
    const [, operator, uriSetter, alice, bob] = await ethers.getSigners();
    this.alice = alice;
    this.bob = bob;
    this.operator = operator;
    this.uriSetter = uriSetter;

    const Legionnaire = await ethers.getContractFactory("Legionnaire");
    this.legionnaire = await Legionnaire.deploy();
    await this.legionnaire.deployed();

    const Satoshiverse = await ethers.getContractFactory("Satoshiverse");
    this.satoshiverse = await Satoshiverse.deploy(
      this.operator.address,
      this.uriSetter.address,
      this.legionnaire.address,
      chainlinkConf.rinkeby.vrfCoordinator,
      chainlinkConf.rinkeby.link,
      chainlinkConf.rinkeby.keyHash,
      chainlinkConf.rinkeby.fee
    );
    await this.satoshiverse.deployed();
    
    await this.satoshiverse.seedPresaleWhiteList([this.alice.address, this.bob.address], 'genesis', [100,5]);
    await this.satoshiverse.seedPresaleWhiteList([this.alice.address, this.bob.address], 'platinum', [100,5]);
    await this.satoshiverse.seedPresaleWhiteList([this.alice.address, this.bob.address], 'gold', [100,5]);
    await this.satoshiverse.seedPresaleWhiteList([this.alice.address, this.bob.address], 'silver', [100,5]);

    await this.legionnaire.addOperator(this.satoshiverse.address);
    await this.legionnaire.addOperator(this.operator.address);
    
    await this.satoshiverse.setActiveDateTime(1637683200); // November 23th at 11:00 AM EST
  });


  describe('Role', function() {
    it('addOperator()', async function() {
      await this.legionnaire.addOperator(this.alice.address);
      expect(await this.legionnaire.isOperator(this.alice.address)).to.be.true;
    });
    it('removeOperator()', async function() {
      await this.legionnaire.removeOperator(this.alice.address);
      expect(await this.legionnaire.isOperator(this.alice.address)).to.be.false;
    });
    describe('reverts if', function() {
      it('non-owner call', async function() {
        await expect(this.legionnaire.connect(this.alice).addOperator(this.bob.address))
          .to.be.revertedWith('Ownable: caller is not the owner');
      });
    });

    it("setPaymentAddress", async function() {
      await expect(this.satoshiverse.connect(this.operator).setPaymentAddress("0x261a2FeaA8DdCBBb3347Fa4409A26D41DC1827f8"))
        .to.be.revertedWith('Ownable: caller is not the owner');
      expect(await this.satoshiverse.isURISetter(this.uriSetter.address)).to.be.true;

      await this.satoshiverse.setPaymentAddress("0x261a2FeaA8DdCBBb3347Fa4409A26D41DC1827f8");
      expect(await this.satoshiverse.svEthAddr()).to.equal("0x261a2FeaA8DdCBBb3347Fa4409A26D41DC1827f8");
    });
  });

  describe("Claim and Purchase", function() {
    it("Toggle claim and purchase", async function() {
      await this.satoshiverse.toggleClaim();
      await expect(this.satoshiverse.claim(2)).to.revertedWith("Claim is disabled");

      await this.satoshiverse.togglePurchase();
      await expect(this.satoshiverse.purchase(2, { value: ethers.utils.parseEther("0.2") })).to.revertedWith("Purchase is disabled");

      await this.satoshiverse.toggleClaim();
      await this.satoshiverse.togglePurchase();
    });

    it("Purchase", async function() {
      dateTime.setTime(1637946060000); // November 26th at 12:00 PM EST
      await network.provider.request({
        method: "evm_setNextBlockTimestamp",
        params: [Math.round(dateTime.getTime() / 1000)]
      });

      await this.satoshiverse.connect(this.alice).purchase(1, { value: ethers.utils.parseEther("0.1") });
      expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(1);

      await this.satoshiverse.connect(this.alice).purchase(1, { value: ethers.utils.parseEther("0.5") });
      expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(2);

      await expect(this.satoshiverse.connect(this.alice).purchase(2, { value: ethers.utils.parseEther("0.1") })).to.revertedWith("Not enough ether");

      dateTime.setTime(1638032460000); // November 27th at 12:00 PM EST
      await network.provider.request({
        method: "evm_setNextBlockTimestamp",
        params: [Math.round(dateTime.getTime() / 1000)]
      });
      
      await this.satoshiverse.connect(this.alice).purchase(5, { value: ethers.utils.parseEther("0.7") });
      expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(7);
    });

    it("Claim", async function() {
      dateTime.setTime(1638284460000) // November 30th at 10:00 AM EST
      await network.provider.request({
        method: "evm_setNextBlockTimestamp",
        params: [Math.round(dateTime.getTime() / 1000)]
      });
      await this.satoshiverse.connect(this.alice).claim(18);
      expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(25);
      expect(await this.satoshiverse.tokensCount(this.alice.address, 'silver')).to.equal(2);
    });

    it("pairLegionnairesWithUris", async function() {
      await this.satoshiverse.pairLegionnairesWithUris([1, 2, 3351], ["8000", "8001", "8002"]);
    });

    it("setBaseTokenURI", async function() {
      await this.legionnaire.connect(this.operator).setBaseTokenURI("https://ipfs.io/");
      expect(await this.legionnaire.baseURI()).to.equal("https://ipfs.io/");

      await this.satoshiverse.connect(this.alice).claim(1);
      await this.satoshiverse.connect(this.alice).purchase(1, { value: ethers.utils.parseEther("0.1") });

      expect(await this.legionnaire.tokenURI(19)).to.equal("https://ipfs.io/ipfs/placeholder");
      
      // console.log(
      //   await this.legionnaire.tokenURI(1), 
      //   await this.legionnaire.tokenURI(2), 
      //   await this.legionnaire.tokenURI(18), 
      //   await this.legionnaire.tokenURI(19), 
      //   await this.legionnaire.tokenURI(3351), 
      //   await this.legionnaire.tokenURI(3358)
      // );
    });

    it("Claim and purchase after self reveal period begins", async function() {
      await this.satoshiverse.pushLeftOverUris([
        "9000", "9001"
      ]);
      await this.satoshiverse.pushLeftOverUris([
        "9002"
      ]);
      await this.satoshiverse.pushLeftOverUris([
        "9003", "9004"
      ]);

      let tx = await this.satoshiverse.getLeftOverUrisLength();
      console.log("Length: ", tx.toNumber());
      await this.satoshiverse.beginSelfRevealPeriod();
      
      await this.satoshiverse.connect(this.alice).claim(1);
      expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(28);
      expect(await this.satoshiverse.tokensCount(this.alice.address, 'silver')).to.equal(0);

      await this.satoshiverse.connect(this.alice).purchase(1, { value: ethers.utils.parseEther("0.4") });
      expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(29);

      await this.satoshiverse.connect(this.alice).purchase(3, { value: ethers.utils.parseEther("0.3") });
      expect(await this.legionnaire.balanceOf(this.alice.address)).to.equal(32);

      await expect(this.satoshiverse.pushLeftOverUris(["9005", "9006"])).to.be.revertedWith("Self-Reveal already begun");

      // console.log(
      //   await this.legionnaire.tokenURI(1), 
      //   await this.legionnaire.tokenURI(2), 
      //   await this.legionnaire.tokenURI(18), 
      //   await this.legionnaire.tokenURI(19), 
      //   await this.legionnaire.tokenURI(20), 
      //   await this.legionnaire.tokenURI(3356), 
      //   await this.legionnaire.tokenURI(3357), 
      //   await this.legionnaire.tokenURI(3358),
      //   await this.legionnaire.tokenURI(3359),
      //   await this.legionnaire.tokenURI(3360),
      //   await this.legionnaire.tokenURI(3361),
      //   await this.legionnaire.tokenURI(3362),
      // );
    });

    it("safeBatchMintAndTransfer", async function() {
      await this.satoshiverse.safeBatchMintAndTransfer(this.bob.address, false, 1000);
      expect(await this.legionnaire.balanceOf(this.bob.address)).to.equal(1000);

      await this.satoshiverse.safeBatchMintAndTransfer(this.bob.address, false, 5638);
      expect(await this.legionnaire.balanceOf(this.bob.address)).to.equal(6638);
    });

    it("transferOwnership", async function() {
      await this.satoshiverse.transferOwnership(this.bob.address);
      expect(await this.satoshiverse.owner()).to.equal(this.bob.address);
    });
  });
});