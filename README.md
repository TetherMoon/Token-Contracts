# TetherMoon contracts

This project is using [Hardhat](https://hardhat.org/getting-started/) for development, compiling, testing and deploying. The development tool used for development is [Visual Studio Code](https://code.visualstudio.com/) which has [great plugins](https://hardhat.org/guides/vscode-tests.html) for solidity development and mocha testing.

## Contracts

* Binance Chain
  * TetherMoon : [0x7EBc08B3D43c3989F2CdfB6aEFADAf28bC148665](https://bscscan.com/address/0x7EBc08B3D43c3989F2CdfB6aEFADAf28bC148665)
  * TetherMoonDividendTracker : [0xe9600b7a2dff8a806c88ec8a9aa0f5823d083309](https://bscscan.com/address/0xe9600b7a2dff8a806c88ec8a9aa0f5823d083309)

* Binance Test Chain
  * TetherMoon : [0x6E6182bca02448494F725A5fd726985a87EDEef5](https://testnet.bscscan.com/address/0x6E6182bca02448494F725A5fd726985a87EDEef5)
  * TetherMoonDividendTracker : [0xbD8B4f7F2141714ae1C02a3f924030A72Cb304eD](https://testnet.bscscan.com/address/0xbD8B4f7F2141714ae1C02a3f924030A72Cb304eD)

## Compiling

Introduction to compiling these contracts

### Install needed packages

```npm
npm install or yarn install
```

### Compile code

```npm
npx hardhat compile
```

### Test code

```node
npx hardhat test
```

### Run a local development node

This is needed before a truffle migrate to the development network. You can also use this for local development with for example metamask. [Hardhat node guide](https://hardhat.org/hardhat-network/)

```node
npx hardhat node
```

### Scripts

Use the scripts in the "scripts" folder. Each script has the command to start it on top.

Make sure you have set the right settings in your ['.env' file](https://www.npmjs.com/package/dotenv). You have to create this file with the following contents yourself:

```node
BSC_PRIVATE_KEY=<private_key>
BSC_TEST_PRIVATE_KEY=<private_key>

BSC_API_TOKEN=<bscscan_api_token>
```