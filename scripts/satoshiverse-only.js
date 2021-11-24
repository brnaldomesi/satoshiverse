// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");
const { BigNumber } = require('ethers');

const oneLink = BigNumber.from(10).pow(18)

const chainlinkConf = {
  mainnet: {
    vrfCoordinator: '0xf0d54349aDdcf704F77AE15b96510dEA15cb7952',
    link: '0x514910771AF9Ca656af840dff83E8264EcF986CA',
    keyHash: '0xAA77729D3466CA35AE8D28B3BBAC7CC36A5031EFDC430821C02BC31A238AF445',
    fee: oneLink.mul(2) //2 LINK
  },
  rinkeby: {
    vrfCoordinator: '0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B',
    link: '0x01BE23585060835E02B77ef475b0Cc51aA1e0709',
    keyHash: '0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311',
    fee: oneLink.div(10) // 0.1 LINK
  }
}

async function main() {
  const networkName = hre.network.name

  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  // const Legionnaire = await hre.ethers.getContractFactory("Legionnaire");
  // const legionnaire = await Legionnaire.deploy();
  // await legionnaire.deployed();

  const Satoshiverse = await hre.ethers.getContractFactory("Satoshiverse");
  const satoshiverse = await Satoshiverse.deploy(
    "0x2e300C4463fb27B5ad83b01757634fe72638ce1b",
    "0x2e300C4463fb27B5ad83b01757634fe72638ce1b",
    "0x5041a99684d38e280e4b0b356185bf18c991f88b",
    chainlinkConf[networkName].vrfCoordinator,
    chainlinkConf[networkName].link,
    chainlinkConf[networkName].keyHash,
    chainlinkConf[networkName].fee
  );

  await satoshiverse.deployed();

  console.log("Satoshiverse deployed to: ", satoshiverse.address);
  // console.log("Legionnaire deployed to: ", legionnaire.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
