// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  // We get the contract to deploy
  const [deployer] = await ethers.getSigners();
  console.log(`Deploying contracts with the account:, ${deployer.address}`);
  console.log(`Account balance:, ${(await deployer.getBalance()).toString()}`);

  const Token = await hre.ethers.getContractFactory("LLDefiL04Ex03");
  console.log("Start the deployment of the contract...");
  const token = await Token.deploy();

  //await token.deployed();
  console.log("Token deployed to:", token.address); 

  /*console.log(
    `Lock with 1 ETH and unlock timestamp ${unlockTime} deployed to ${token.address}`
  );*/
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
