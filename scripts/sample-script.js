// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");
const { BigNumber } = require('ethers');

const oneLink = BigNumber.from(10).pow(18)

const chainlinkConf = {
  rinkeby: {
    vrfCoordinator: '0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B',
    link: '0x01BE23585060835E02B77ef475b0Cc51aA1e0709',
    keyHash: '0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311',
    fee: oneLink.div(10) // 0.1 LINK
  }
}

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Legionnaire = await hre.ethers.getContractFactory("Legionnaire");
  const legionnaire = await Legionnaire.deploy();
  await legionnaire.deployed();

  const SatoshiVerse = await hre.ethers.getContractFactory("SatoshiVerse");
  const satoshiVerse = await SatoshiVerse.deploy(
    legionnaire.address,
    chainlinkConf.rinkeby.vrfCoordinator,
    chainlinkConf.rinkeby.link,
    chainlinkConf.rinkeby.keyHash,
    chainlinkConf.rinkeby.fee
  );

  await satoshiVerse.deployed();

  console.log("SatoshiVerse deployed to:", satoshiVerse.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
