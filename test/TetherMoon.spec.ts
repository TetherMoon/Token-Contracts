import chai, { expect } from 'chai'
import { BigNumber, constants } from 'ethers'
import { ethers, network, waffle } from 'hardhat'

import { expandTo18Decimals, expandTo30Decimals } from './shared/utilities'
import { v2Fixture } from './shared/fixtures'

import { TetherMoon, TetherMoonDividendTracker, WBNB, USDT, PancakeFactory, PancakeRouter, IPancakePair }  from '../typechain';
import mocha from 'mocha'

chai.use(waffle.solidity)

describe('TetherMoon', () => {
  const { provider, createFixtureLoader } = waffle;
  const [ owner, marketing, user1, user2 ] = provider.getWallets()
  const loadFixture = createFixtureLoader([owner, marketing], provider)

  let buyPath: string[] = []
  let sellPath: string[] = []

  let WBNB: WBNB
  let USDT: USDT
  let factory: PancakeFactory
  let router: PancakeRouter
  let tetherMoon: TetherMoon
  let dividendTracker: TetherMoonDividendTracker
  let pair: IPancakePair
  beforeEach(async function() {

    const fixture = await loadFixture(v2Fixture)
    WBNB = fixture.WBNB
    USDT = fixture.USDT
    factory = fixture.factory
    router = fixture.router
    tetherMoon = fixture.tetherMoon
    dividendTracker = fixture.dividendTracker
    pair = fixture.pair

    buyPath = [ WBNB.address, tetherMoon.address ]
    sellPath = [ tetherMoon.address, WBNB.address ]
  })

  const ethLiquidity = expandTo18Decimals(5)
  const tokenLiquidity = expandTo30Decimals(1000)
  const addTokenLiquidity = async() => {
    await tetherMoon.approve(router.address, constants.MaxUint256);
    await router.addLiquidityETH(tetherMoon.address, tokenLiquidity, tokenLiquidity, ethLiquidity, owner.address, constants.MaxUint256, { value: ethLiquidity });
  }

  it('Deployed correctly', async () => {
    expect(await tetherMoon.dexRouters(router.address)).to.eq(true)
    expect(await tetherMoon.dexRouters(owner.address)).to.eq(false)
    expect(await tetherMoon.defaultDexRouter()).to.eq(router.address)
    expect(await tetherMoon.automatedMarketMakerPairs(await tetherMoon.defaultPair())).to.eq(true)
    expect(await tetherMoon.USDT()).to.eq(USDT.address)
    expect(await tetherMoon.marketingWallet()).to.eq(marketing.address)
    expect(await tetherMoon.liquidityWallet()).to.eq(owner.address)
    expect(await tetherMoon.transfersEnabled()).to.eq(false)
    expect(await tetherMoon.totalSupply()).to.eq(expandTo30Decimals(1000))
  })

  it('Not possible to initializeDividendTracker again', async () => {
    await expect(tetherMoon.initializeDividendTracker(dividendTracker.address)).to.be.revertedWith("TetherMoon: Dividend tracker already initialized")
  })

  describe('Transfers', () => {
    it('Fail when disabled on wallets not excluded', async () => {
      await tetherMoon.transfer(user1.address, expandTo30Decimals(2))
      await expect(tetherMoon.connect(user1).transfer(owner.address, expandTo30Decimals(2))).to.be.revertedWith("TetherMoon: Transfering is disabled")
    })
  
    it('Fail when exceeding max wallet amount on wallets not excluded', async () => {
      await tetherMoon.setTransfersEnabled(true);
      await tetherMoon.transfer(user1.address, expandTo30Decimals(15.01))
      await expect(tetherMoon.connect(user1).transfer(user2.address, expandTo30Decimals(15.01))).to.be.revertedWith("TetherMoon: Exceeds maximum wallet token amount")
      await tetherMoon.connect(user1).transfer(owner.address, expandTo30Decimals(15.01))
    })
  
    it('Succeed when enabled with 0 fees applied', async () => {
      await tetherMoon.setTransfersEnabled(true);
      await tetherMoon.transfer(user1.address, expandTo30Decimals(10))
      await tetherMoon.connect(user1).transfer(user2.address, expandTo30Decimals(10))
    })

    it('Succeed for adding liquidity by owner, fail for trades', async () => {
      await addTokenLiquidity()
      await expect(router.connect(user1).swapETHForExactTokens(expandTo30Decimals(1), buyPath, user1.address, constants.MaxUint256, { value: expandTo18Decimals(1) }))
        .to.be.revertedWith("Pancake: TRANSFER_FAILED")
    })
  })

  describe('Fees', () => {
    beforeEach(async() => {
      await addTokenLiquidity();
      await tetherMoon.setTransfersEnabled(true);
    })

    it('Not payed by excluded wallet', async () => {
      await router.swapETHForExactTokens(expandTo30Decimals(1), buyPath, owner.address, constants.MaxUint256, { value: expandTo18Decimals(1) })
      expect(await tetherMoon.balanceOf(owner.address)).to.eq(expandTo30Decimals(1))
      
      await router.swapExactTokensForETH(expandTo30Decimals(1), 0, sellPath, owner.address, constants.MaxUint256)
      expect(await tetherMoon.balanceOf(owner.address)).to.eq(0)
    })

    it('Correctly applied on buy', async () => {
      const liquidityBalance = await pair.balanceOf(owner.address)

      await router.connect(user1).swapETHForExactTokens(expandTo30Decimals(1), buyPath, user1.address, constants.MaxUint256, { value: expandTo18Decimals(1) })

      expect(await tetherMoon.balanceOf(user1.address)).to.eq(expandTo30Decimals(0.85))
      expect(await USDT.balanceOf(dividendTracker.address)).to.eq(0) // fees are not transfered on buys, but on next transfer/sell (support buying)
      expect(await tetherMoon.balanceOf(marketing.address)).to.eq(0)
      expect((await pair.balanceOf(owner.address)).sub(liquidityBalance)).to.eq(0)

      await tetherMoon.connect(user1).transfer(user2.address, expandTo30Decimals(0.85))
      expect(await tetherMoon.balanceOf(marketing.address)).to.eq(0)
      expect(await USDT.balanceOf(dividendTracker.address)).to.eq('1495222775978935325')
    })

    it('Correctly applied on sell', async () => {
      const liquidityBalance = await pair.balanceOf(owner.address)
      const marketingBalanceBefore = await marketing.getBalance()

      await router.connect(user1).swapETHForExactTokens(expandTo30Decimals(10), buyPath, user1.address, constants.MaxUint256, { value: expandTo18Decimals(1) })

      await tetherMoon.connect(user1).transfer(user2.address, expandTo30Decimals(1)); // needed because someone needs to retrieve dividend
      await tetherMoon.connect(user1).approve(router.address, expandTo30Decimals(1));
      await router.connect(user1).swapExactTokensForETHSupportingFeeOnTransferTokens(expandTo30Decimals(1), 0, sellPath, user1.address, constants.MaxUint256)

      expect(await tetherMoon.balanceOf(user1.address)).to.eq(expandTo30Decimals(6.5))
      expect(await USDT.balanceOf(dividendTracker.address)).to.eq('877331767812314375')
      expect(await USDT.balanceOf(user1.address)).to.eq('13411549556982976743')
      expect(await USDT.balanceOf(user2.address)).to.eq('1923180725722701674')
      expect((await marketing.getBalance()).sub(marketingBalanceBefore)).to.eq('253663603326943')
      expect((await pair.balanceOf(owner.address)).sub(liquidityBalance)).to.eq('3556749605332962500343')
    })

    it('Works with multiple buys and sells', async () => {
      await router.swapETHForExactTokens(expandTo30Decimals(1), buyPath, user1.address, constants.MaxUint256, { value: expandTo18Decimals(5) })

      const wallets = provider.getWallets().slice(3, 10)
      for(let idx = 0; idx < wallets.length; idx++) {
        const wallet = wallets[idx]
        await router.connect(wallet).swapETHForExactTokens(expandTo30Decimals(1), buyPath, wallet.address, constants.MaxUint256, { value: expandTo18Decimals(5) })
        expect(await tetherMoon.balanceOf(wallet.address)).to.eq(expandTo30Decimals(0.85))
        expect(await dividendTracker.balanceOf(wallet.address)).to.eq(expandTo30Decimals(0.85))

        if (idx == 3 || idx == 5) {
          await tetherMoon.connect(wallets[idx-1]).approve(router.address, expandTo30Decimals(0.85));
          await router.connect(wallets[idx-1]).swapExactTokensForETHSupportingFeeOnTransferTokens(expandTo30Decimals(0.85), 0, sellPath, wallets[idx-1].address, constants.MaxUint256)

          expect(await tetherMoon.balanceOf(wallets[idx-1].address)).to.eq(expandTo30Decimals(0))
          expect(await dividendTracker.balanceOf(wallets[idx-1].address)).to.eq(expandTo30Decimals(0))
        }
      }
    })
  })
})
