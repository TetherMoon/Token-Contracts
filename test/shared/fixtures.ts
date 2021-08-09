import { Wallet, Contract, providers, utils, constants } from 'ethers'
import { waffle } from 'hardhat'

import { expandTo18Decimals } from './utilities'

import { TetherMoon, TetherMoonDividendTracker, WBNB, USDT, PancakeFactory, PancakeRouter, IPancakePair }  from '../../typechain';

import TetherMoonAbi from '../../artifacts/contracts/TetherMoon.sol/TetherMoon.json'
import TetherMoonDividendTrackerAbi from '../../artifacts/contracts/TetherMoonDividendTracker.sol/TetherMoonDividendTracker.json'
import WBNBAbi from '../../artifacts/contracts/test/WBNB.sol/WBNB.json'
import USDTAbi from '../../artifacts/contracts/test/USDT.sol/USDT.json'
import PancakeFactoryAbi from '../../artifacts/contracts/test/PancakeFactory.sol/PancakeFactory.json'
import PancakeRouterAbi from '../../artifacts/contracts/test/PancakeRouter.sol/PancakeRouter.json'
import IPancakePairAbi from '../../artifacts/contracts/test/PancakeRouter.sol/IPancakePair.json'

const overrides = {
  gasLimit: 9500000
}

interface V2Fixture {
  WBNB: WBNB 
  USDT: USDT
  factory: PancakeFactory
  router: PancakeRouter
  tetherMoon: TetherMoon
  dividendTracker: TetherMoonDividendTracker
  pair: IPancakePair
}

export async function v2Fixture([wallet, marketing]: Wallet[], provider: providers.Web3Provider): Promise<V2Fixture> {
  // base tokens
  const WBNB = await waffle.deployContract(wallet, WBNBAbi, [], overrides) as unknown as WBNB
  const USDT = await waffle.deployContract(wallet, USDTAbi, [], overrides) as unknown as USDT

  // pancake router
  const factory = await waffle.deployContract(wallet, PancakeFactoryAbi, [wallet.address], overrides) as unknown as PancakeFactory
  const router = await waffle.deployContract(wallet, PancakeRouterAbi, [factory.address, WBNB.address], overrides) as unknown as PancakeRouter

  await USDT.approve(router.address, constants.MaxUint256);
  await router.addLiquidityETH(USDT.address, expandTo18Decimals(40000), 0, 0, wallet.address, constants.MaxUint256, { value: expandTo18Decimals(20) })

  // tethermoon
  const tetherMoon = await waffle.deployContract(wallet, TetherMoonAbi, [router.address, USDT.address, marketing.address], overrides) as unknown as TetherMoon
  const dividendTracker = await waffle.deployContract(wallet, TetherMoonDividendTrackerAbi, [USDT.address, tetherMoon.address], overrides) as unknown as TetherMoonDividendTracker
  await tetherMoon.initializeDividendTracker(dividendTracker.address)

  // pair
  const pairAddress = await factory.getPair(tetherMoon.address, WBNB.address)
  const pair = new Contract(pairAddress, IPancakePairAbi.abi, provider) as IPancakePair;

  return {
    WBNB,
    USDT,
    factory,
    router,
    tetherMoon,
    dividendTracker,
    pair,
  }
}
