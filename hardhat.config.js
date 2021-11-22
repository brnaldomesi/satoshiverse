require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require('dotenv').config()
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1,
      }
    }
  },
  gasReporter: {
    enabled: true,
    currency: 'USD',
    gasPrice: 1,
    showMethodSig: true,
    coinmarketcap: '2f10f12d-9de0-4b8d-8991-42c4d9ee17f1'
  },
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      blockGasLimit: 875_000_000,
    },
    rinkeby: {
      url: process.env.RINKEBY_URL,
      accounts: [process.env.PRIVATEKEY]
    },
    mainnet: {
      url: process.env.MAINNET_URL,
      accounts: [process.env.PRIVATEKEY]
    }
  },
  mocha: {
    timeout: 100000
  }
};
