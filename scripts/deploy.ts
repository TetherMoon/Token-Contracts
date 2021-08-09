// npx hardhat run scripts/deploy.ts --network bscmainnet

require("dotenv").config({path: `${__dirname}/.env`});
import { ethers } from "hardhat";

import { TetherMoon, TetherMoonDividendTracker }  from '../typechain';

import TetherMoonAbi from '../abi/contracts/TetherMoon.sol/TetherMoon.json'
import TetherMoonDividendTrackerAbi from '../abi/contracts/TetherMoonDividendTracker.sol/TetherMoonDividendTracker.json'

const main = async() => {

  // const signer = ethers.provider.getSigner("0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"); // hardhat
  // const signer = ethers.provider.getSigner("0xCCD0C72BAA17f4d3217e6133739de63ff6F0b462"); // ganache
  // const signer = ethers.provider.getSigner("0x26BbF93E659415654eCD9F5753e35F94b6185b64"); // bsc test
  const signer = ethers.provider.getSigner("0x7e32F6813fFba61dff2745f17a2f167900A873e8"); // bsc main

  const marketing = "0x9cDc97B6096D894efE5F5161c6e4995a1c8430bd"; // bsc test
  // const marketing = "0xd7BC1cC903c0871eb0D1bF9990CcaBb98E53d044"; // bsc main

  // const router: string = ""; // ganache
  // const router: string = "0xD99D1c33F9fC3444f8101754aBC46c52416550D1"; // factory test
  const router: string = "0x10ED43C718714eb63d5aA57B78B54704E256024E"; // factory main

  // const USDT: string = ""; // ganache
  // const USDT: string = "0x7ef95a0fee0dd31b22626fa2e10ee6a223f8a684"; // usdt test
  const USDT: string = "0x55d398326f99059ff775485246999027b3197955"; // usdt main
  
  console.log("deploying");

  // const tetherMoon = new ethers.Contract("0x6E6182bca02448494F725A5fd726985a87EDEef5", TetherMoonAbi, signer) as TetherMoon; // test
  const tetherMoon = new ethers.Contract("0x7EBc08B3D43c3989F2CdfB6aEFADAf28bC148665", TetherMoonAbi, signer) as TetherMoon; // main
  // const TetherMoon = await ethers.getContractFactory("TetherMoon");
  // const tetherMoon = await TetherMoon.connect(signer).deploy(router, USDT, marketing) as TetherMoon;
  // await tetherMoon.deployed();
  console.log("TetherMoon deployed to:", tetherMoon.address);

  // const dividendTracker = new ethers.Contract("0xbD8B4f7F2141714ae1C02a3f924030A72Cb304eD", TetherMoonDividendTrackerAbi, signer) as TetherMoonDividendTracker; // test
  const dividendTracker = new ethers.Contract("0xe9600b7a2dff8a806c88ec8a9aa0f5823d083309", TetherMoonDividendTrackerAbi, signer) as TetherMoonDividendTracker; // main
  // const TetherMoonDividendTracker = await ethers.getContractFactory("TetherMoonDividendTracker");
  // const dividendTracker = await TetherMoonDividendTracker.connect(signer).deploy(USDT, tetherMoon.address) as TetherMoonDividendTracker;
  // await dividendTracker.deployed();
  console.log("TetherMoonDividendTracker deployed to:", dividendTracker.address);

  // await tetherMoon.initializeDividendTracker(dividendTracker.address)
  // console.log("TetherMoonDividendTracker initialized");

  // await tetherMoon.setTransfersEnabled(true)

  // await dividendTracker.excludeFromDividends(await tetherMoon.defaultPair())
  // await dividendTracker.excludeFromDividends(await tetherMoon.defaultDexRouter())
  // await dividendTracker.excludeFromDividends(dividendTracker.address)
  // await dividendTracker.excludeFromDividends(signer._address)
  // await dividendTracker.excludeFromDividends(marketing)
  // await dividendTracker.excludeFromDividends(tetherMoon.address)
}

main()
//   .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
