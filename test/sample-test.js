const { expect } = require("chai");
const { ethers, waffle } = require("hardhat");
const provider = waffle.provider;

describe("SatoshiVerse", function () {
  const dateTime = new Date(1636905600000); // November 14th at 11:00 AM EST

  before(async function() {
    const [owner, user, alice] = await ethers.getSigners();
    this.owner = owner;
    this.user = user;
    this.alice = alice;

    const SatoshiVerse = await ethers.getContractFactory("SatoshiVerse");
    this.satoshiVerse = await SatoshiVerse.deploy();
    await this.satoshiVerse.deployed();
    await this.satoshiVerse.seedPresaleWhiteList([this.user.address, this.alice.address], 'genesis', [5,5]);
    await this.satoshiVerse.seedPresaleWhiteList([this.user.address, this.alice.address], 'platinum', [5,5]);
    await this.satoshiVerse.seedPresaleWhiteList([this.user.address, this.alice.address], 'gold', [5,5]);
    await this.satoshiVerse.seedPresaleWhiteList([this.user.address, this.alice.address], 'silver', [5,5]);

    await this.satoshiVerse.seedPublicWhiteList([this.user.address, this.alice.address], [2, 1]);
  });

  describe("Claim and Purchase", function() {
    it("Purchase", async function() {
      dateTime.setTime(1637168400000); // November 17th at 12:00 PM EST
      await network.provider.request({
        method: "evm_setNextBlockTimestamp",
        params: [Math.round(dateTime.getTime() / 1000)]
      });

      await this.satoshiVerse.connect(this.user).purchase(1, { value: ethers.utils.parseEther("0.1") });
      expect(await this.satoshiVerse.balanceOf(this.user.address)).to.equal(1);

      await expect(this.satoshiVerse.purchase(2, { value: ethers.utils.parseEther("0.2") })).to.revertedWith("Not allowed to purchase");

      await this.satoshiVerse.connect(this.user).purchase(5, { value: ethers.utils.parseEther("0.5") });
      expect(await this.satoshiVerse.balanceOf(this.user.address)).to.equal(2);

      await expect(this.satoshiVerse.connect(this.user).purchase(2, { value: ethers.utils.parseEther("0.1") })).to.revertedWith("Not enough ether");

      dateTime.setTime(1637254800000); // November 18th at 12:00 PM EST
      await network.provider.request({
        method: "evm_setNextBlockTimestamp",
        params: [Math.round(dateTime.getTime() / 1000)]
      });
      
      await this.satoshiVerse.connect(this.user).purchase(5, { value: ethers.utils.parseEther("0.7") });
      expect(await this.satoshiVerse.balanceOf(this.user.address)).to.equal(7);
    });

    it("Claim", async function() {
      dateTime.setTime(1637506800000) // November 21th at 10:00 AM EST
      await network.provider.request({
        method: "evm_setNextBlockTimestamp",
        params: [Math.round(dateTime.getTime() / 1000)]
      });
      await this.satoshiVerse.connect(this.user).claim(18);
      expect(await this.satoshiVerse.balanceOf(this.user.address)).to.equal(25);
      expect(await this.satoshiVerse.tokensCount(this.user.address, 'silver')).to.equal(2);
    });

    it("Claim and purchase after reveal", async function() {
      await this.satoshiVerse.startReveal();
      await this.satoshiVerse.connect(this.user).claim(1);
      expect(await this.satoshiVerse.balanceOf(this.user.address)).to.equal(26);
      expect(await this.satoshiVerse.tokensCount(this.user.address, 'silver')).to.equal(1);

      await this.satoshiVerse.connect(this.user).purchase(4, { value: ethers.utils.parseEther("0.4") });
      expect(await this.satoshiVerse.balanceOf(this.user.address)).to.equal(30);
    });
  });
});
