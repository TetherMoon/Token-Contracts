// SPDX-License-Identifier: MIT

/**
 *   ________           __      __                            __       __
 *   /        |         /  |    /  |                          /  \     /  |
 *   $$$$$$$$/______   _$$ |_   $$ |____    ______    ______  $$  \   /$$ |  ______    ______   _______
 *     $$ | /      \ / $$   |  $$      \  /      \  /      \ $$$  \ /$$$ | /      \  /      \ /       \
 *     $$ |/$$$$$$  |$$$$$$/   $$$$$$$  |/$$$$$$  |/$$$$$$  |$$$$  /$$$$ |/$$$$$$  |/$$$$$$  |$$$$$$$  |
 *     $$ |$$    $$ |  $$ | __ $$ |  $$ |$$    $$ |$$ |  $$/ $$ $$ $$/$$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |
 *     $$ |$$$$$$$$/   $$ |/  |$$ |  $$ |$$$$$$$$/ $$ |      $$ |$$$/ $$ |$$ \__$$ |$$ \__$$ |$$ |  $$ |
 *     $$ |$$       |  $$  $$/ $$ |  $$ |$$       |$$ |      $$ | $/  $$ |$$    $$/ $$    $$/ $$ |  $$ |
 *     $$/  $$$$$$$/    $$$$/  $$/   $$/  $$$$$$$/ $$/       $$/      $$/  $$$$$$/   $$$$$$/  $$/   $$/
 *
 *
 * MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNXK0OOkkkxxxxxdddxxxxxkkkOOO00KKXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMMMMMMMMMMMNK0OkxddddxxxxxxxxkxxxkkxxkkkkkOOOkkkkO00KXWMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMMMMMMMNKOkxddxxxxxddxxxxxxxdxxdxxxxxkkkkkkkkkkO000OOO00KXWMMMMMMMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMMMMN0kxddxkkkkkkxxdoddddddxxxxxxxxxxxxxxxxxxkkk000KKKK0000KXWMMMMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMNKkdodxkkkkkkxddddddxxkkOOOOOOkkkkO000000OOkkkkkkOO0KKKKKKK00KNWMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMXOdodxkkkkxddodddxkkkOOOOOOOOOkdlccldk0000000000000OOOOO0KKXXXXK0KXWMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMWXkooxxxxxxdooodxkkkOOOOOOOOOOOOxlc:::cclxO000000KKKKKKKK00OOO0XXXXXXKKXNMMMMMMMMMMMMMM
 * MMMMMMMMMMMMXkodxxkkkdooodkkkkOOOOOOOOOOOOOkoc::::ccccldO000KKKKKKKKKKKKXK0000KXXXXXKKXNMMMMMMMMMMMM
 * MMMMMMMMMMNOodxkkkkdoooxkkOOOOOOOOOOOOOOOOkl:::::::cccccoO0KKKKKKKKKKKKKXXXXK000KKKKXXXKXWMMMMMMMMMM
 * MMMMMMMMW0dodxkkkdoodkkkkOOOOOOOOOOOOOOOOxc:::::::::cccccok0KKKKKKKKKKXXXXXXXXXK00KXKXXXKKNMMMMMMMMM
 * MMMMMMMNkodxddxxoldkkkOOOOOOOOOOOOO00000xc;;:::::::cccccccokKKKKKKKXXXXXXXXXXXXNNK00KXXXNX0KWMMMMMMM
 * MMMMMMXxoxddddolokkkkOOOOOOOOOOOO000000kc;;::::::::cccccclloOKKKKXXXXXXXXXXXXXXNNNNK0KXXKXXK0NMMMMMM
 * MMMMMKddxxdddooxkkkOOOOOOOOOOOO0000000Ol;;;:::::::ccccclllllx0XXXXXXXXXXXXXXXNNNNNNNX00XKKXXK0XMMMMM
 * MMMMKddxxxxdookOOOOOOOOOOOOOO000000000d:;;;:::::::cccccllllookKXXXXXXXXXXXXXXNNNNNNNNX0OKKKXNKOXMMMM
 * MMMKddxdxkdldkOOOOOOOOOOOO00000000000kc;;;;;::::::ccccclllooox0XXXXXXXXXXXXXXNNNNNNNNNNKO0KXNNKOXMMM
 * MMXddkxdxxldkOOOOOOOOOO00000000000000o;;:::::cccccclllloooddddOXXXXXXXXXXXXNNNNNNNNNNNNX0O0XKKX0ONMM
 * MNkoxxxxdodOOOOOOOOOOO00000000000000Ol,lkOOOOOOOOO0000000000OdkKXXXXXXXXXNNNNNNNNNNNNNXXX0k0KKKXOOWM
 * M0oxkxxxookOOOOOO0000000000000000KKKx:,oKKKKKKKKXXXXXXXXXXXX0xk0XXXXXXNNNNNNNNNNXXXXXXXXXXOk000KKkKM
 * XxdkxkkdokOOOOO0000000000000000000KKd;,codddddkKXXXXKOkkOOO0Oxk0XXXXXNNNNNNNXXXXXXXXXXXXXXKkk0OOKOON
 * OdkxdxxodOOOO00000000000000000KKKKKKo,,,,,;;::o0XXXXKxodddxxxxxOXXXXNXXXXXXXXXXXXXXXXXKKKKKOxOOO00k0
 * kdkxxkdokOOOO000000000000KKKKKKKKKKKd:::::::::o0XXXXKkdxxkkkkkxOXNNXXXXXXXXXXXXXXXKKKKKKKKK0xkOkO0kk
 * xxkxkkodO0O0O000000000000KKKKKKKKKKOxxdc:;,,,;lOKKKK0kdxxxxxkO0OKXNXNNXXXXXXXXXKKKKKKKKKKKK0xxOkkOkk
 * dkkxkkdxO000000000000000KKKKKKKKK0xc:cllllllllokOO000OkkkkkxxxdookKXXXXXXXXXKKKKKKKKKKKKKK00kxkkkOOx
 * dOOkOkdk000000000000KKKKKKKKKKKKOo:::::;;;;;;:o0XXXXXOdoolllllcccld0XXXXXXXKKKKKKKKKK0000000kdkkxkOd
 * dOkkOxdk000000000KKKKKKKKKKKKKKOo:::::::::::::o0XXXXKdcccccccccc:ccoOKXXKKKKKKKKK00000000000kdxkxkOd
 * dOkkOxdk00000000KKKKKKKKKKKKKKOoccccccccccllloxKXNXXKo;;;:::::::::::lkKKKKKKKKK000000000000Okdxkkkko
 * xOOxkkdk00000KKKKKKKKKKKKKKKK0dclllllllloooddxOKXXXXKo,,;;;;;;;;;::::lOKKKKKK000000000000OOOxoxkxkkd
 * xOOkkOxx00KKKKKKKKKKKKKKKXXXKxllllooooodddxxxxkKXXXXKo;,,,;;;;;;;;;;;;o0KKK0000000000OOOOOOOdoxkkkxd
 * kkOkkOxx0KKKKKKKKKKKKKKXXXXXOdoooooddddxxxxxdoxKXXXXKo;;,,,,,;;;;;;;;;:xK000000000OOOOOOOOOkookxxxdx
 * Ox0OkOkxOKKKKKKKKKKKKXXXXXXXkooddddxkkxxxxxdoooOXXXXOl;;,,,,,,::;,,;;;;o000000000OOOOOOOOOOxodxxxxok
 * XkO0kOOxkKKKKKKKKKKXXXXXXXXKkddddxO0K0kkkxxddoodkKKOocc:::::::dOxl:;;;;lk00000OOOOOOOOOkkkkooddxxddK
 * WOkK0kOOxOKKKKKXXXXXXXXXXXXKkdxk0KXNXXXXKKKKKKKKKKK00000OOOOOO0000kdc;,ck00OOOOOOOOOkkkkkkdlddodxokW
 * MXOO0000kk0XXXXXXXXXXXXXXXXX00KXXXXXNNNNNXXXXXXXXXXXKKKKK00KKKK00000OxoxO0OOOOOOOOOOkkkkkxloxxxxddKM
 * MMKk0KK00kkKXXXXXXXXXXXXXXXXXXXNXXXXXXXNX0k0XXXXXXKKKKKKOod0KK0000000000OOOOOOOOOOOkkkkkxloxddxdoOWM
 * MMW0OKKK00OOKXXXXXXXXXXXXXXXNXXXXXXXXXXXXOdOXXXKK000KKKKkco000000000OOOOOOOOOOOkkkkkkkkxoldddddokWMM
 * MMMW0OKXKXKOOKXXXXXXXXXXXXXXXXXXXXXXXXXXXOdOKKKKOolkKKK0kloO00000OOOOOOOOOOkkkkkkkkkkkdlodddddokNMMM
 * MMMMWK0XXXKK0OKXXXXXXXXXXXXXXXXXXXXXXXXXXkdOKKKKklcx0000kcoO0OOOOOOOOOOOOkkkkkkkkkkkxdloddoddokNMMMM
 * MMMMMWK0KXK0KK00XNNNNXXXXXXXXXXXXXXXXXXKKkokKKKKklcx0000kcoOOOOOOOOOOOOOkkkkkkkkkkkxolododddokNMMMMM
 * MMMMMMWX0KXKKXK00KXNNXXXXXXXXXXXXXXXKKKKKkokKKK0klcd0000kcoOOOOOOOOOOkkkkkkkkkkxxxolloooodoo0WMMMMMM
 * MMMMMMMMNKKXXXXXK00KXNXXXXXXXXXXXXXKKKKKKkok0000xlcd0000kloOOOOOOOOkkkkkkkkkkkxxdllodoodoodKMMMMMMMM
 * MMMMMMMMMWXKKXXXXKKK0KXXXXXXXXXXXKKKKKKKKkok0000xlcd000OxcoOOOOOOOkkkkkkkkkkkxolloxxddoooONMMMMMMMMM
 * MMMMMMMMMMMWXKKXXKXXK000KXXXXXKKKKKKKKKK0kdk0000xlcdOOOOkodOOOOkkkkkkkkxkkxdollodxdddookXMMMMMMMMMMM
 * MMMMMMMMMMMMMNXKXXXXXXX0000KKKKKKKKKKK000OOO0000xlcdOOOOOkkOkkkkkkkkkkxxdollodxxxxdooxKWMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMWXKKXXXXXXK0OOOO0KKK0000000000OOOxolxOOOOOOkkkkkkkkkxxdoooodddxxxdodkXWMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMWXK00KXKKKK0OOOOkkOO00000000OOOOkkkOOOkkkkkkkkxdoooooddxxxdddooxONMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMMWNKK00KKK0KK00OkkkkkkxxkkkkkkkkkkkxxxdddddooooodxxxxxxxdooxOKWMMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMMMMMWNKK0OO00000000OkkxxdxxdddddddddoooooodxxxxxxxxxdoodkOXWMMMMMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMMMMMMMMMWXK0OOkOOO0OkkkkxxkxxxxxxxxxdddddddxxxxddodxkOKNMMMMMMMMMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNXK0OOkkxxxxxxxxxxxxxxxxxdddodddxkkO0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 * MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWXKOOkxxxddoooooooddddxkO0KNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 */

pragma solidity ^0.8.4;

import './token/ERC20.sol';
import './token/ERC1363/ERC1363.sol';
import './token/ERC2612/ERC2612.sol';
import './token/extensions/ERC20Burnable.sol';
import './token/extensions/ERC20TokenRecover.sol';
import './interfaces/IDEXRouter.sol';
import './interfaces/IDEXFactory.sol';
import './interfaces/IDEXPair.sol';
import './ITetherMoon.sol';
import './ITetherMoonDividendTracker.sol';

/**
 *  Earn USDT while holding TetherMoon tokens!
 *
 *  Tokenomics:
 *  1 quadrillion tokens
 *
 *  Buy fee 10%:
 *  15 % USDT reflection
 *  0 % liquidity fee
 *  0 % marketing fee
 *
 *  Sell fee 25%:
 *  10 % USDT reflection
 *  10 % liquidity fee
 *  5 % marketing fee
 *
 *  Extra TetherMoon tokens send to the contract are seen as dividend
 *
 *  Max wallet size of 1%
 *
 *  https://t.me/TETHERMOON
 *  https://tethermoon.io/
 *  https://twitter.com/tethermoon
 *
 */
contract TetherMoon is ERC20, ERC1363, ERC2612, ERC20Burnable, ERC20TokenRecover, ITetherMoon {
    mapping(address => bool) public override dexRouters;
    // store addresses that are automatic market maker (dex) pairs. Any transfer *to* these addresses
    // could be subject to a maximum transfer amount
    mapping(address => bool) public override automatedMarketMakerPairs;

    IDEXRouter public override defaultDexRouter;
    address public override defaultPair;

    address public immutable override USDT;
    address public override marketingWallet;
    address public override liquidityWallet;
    ITetherMoonDividendTracker public override dividendTracker;

    bool public override transfersEnabled = false;
    bool private isSwappingFees;

    // Supply and amounts
    // 1 quadrillion (this will also be the total supply as there is not public mint function)
    uint256 private _startSupply = 1000 * (10**12) * (10**18);
    uint256 public override swapTokensAtAmount = 20 * (10**9) * (10**18);
    uint256 public override maxWalletToken = 10 * (10**12) * (10**18); // 1% of total supply

    // fees (from a total of 10000)
    uint256 public override buyFeesCollected = 0;
    uint256 public override buyDividendFee = 1500;
    uint256 public override buyLiquidityFee = 0;
    uint256 public override buyMarketingFee = 0;
    uint256 public override buyTotalFees = buyDividendFee + buyLiquidityFee + buyMarketingFee;

    uint256 public override sellFeesCollected = 0;
    uint256 public override sellDividendFee = 1000;
    uint256 public override sellLiquidityFee = 1000;
    uint256 public override sellMarketingFee = 500;
    uint256 public override sellTotalFees = sellDividendFee + sellLiquidityFee + sellMarketingFee;

    // use by default 300,000 gas to process auto-claiming dividends
    uint256 public override gasForProcessing = 300000;

    // white listed adresses (excluded from fees and dividends)
    // these addresses can also make transfers before presale is over
    mapping(address => bool) public override whitelistedAddresses;

    // exlcude from fees and max transaction amount
    mapping(address => bool) private _isExcludedFromFees;

    bool private nameChanged = false;

    constructor(
        address _routerAddress,
        address _usdt,
        address _marketingWallet
    ) ERC2612('TetherMoon', 'TRM') {
        IDEXRouter _dexRouter = IDEXRouter(_routerAddress);
        USDT = _usdt;
        marketingWallet = _marketingWallet;
        liquidityWallet = owner();

        defaultDexRouter = _dexRouter;
        dexRouters[_routerAddress] = true;
        defaultPair = IDEXFactory(_dexRouter.factory()).createPair(address(this), _dexRouter.WETH());
        _setAutomatedMarketMakerPair(defaultPair, true);

        //_mint is an internal function in ERC20.sol that is only called here, and CANNOT be called ever again
        _mint(owner(), _startSupply);
    }

    function initializeDividendTracker(ITetherMoonDividendTracker _dividendTracker) external override onlyOwner {
        require(address(dividendTracker) == address(0), "TetherMoon: Dividend tracker already initialized");
        dividendTracker = _dividendTracker;

        // exclude from receiving dividends
        dividendTracker.excludeFromDividends(address(defaultPair));
        dividendTracker.excludeFromDividends(address(dividendTracker));
        dividendTracker.excludeFromDividends(address(defaultDexRouter));

        // whitlist wallets f.e. owner wallet to send tokens before presales are over
        setWhitelistAddress(address(this), true);
        setWhitelistAddress(owner(), true);
        setWhitelistAddress(marketingWallet, true);
    }

    receive() external payable {}

    //== BEP20 owner function ==
    function getOwner() public view override returns (address) {
        return owner();
    }

    function updateNameAndSymbol(string memory name_, string memory symbol_) external onlyOwner {
        require(!nameChanged, "TetherMoon: Name already changed");
        _name = name_;
        _symbol = symbol_;
        nameChanged = true;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1363, ERC2612) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function recoverERC20(address tokenAddress, uint256 tokenAmount)
        public
        override(ERC20TokenRecover, IERC20TokenRecover)
        onlyOwner
    {
        require(tokenAddress != address(this), 'Cannot retrieve TetherMoons');
        super.recoverERC20(tokenAddress, tokenAmount);
    }

    function setWhitelistAddress(address _whitelistAddress, bool whitelisted) public override onlyOwner {
        whitelistedAddresses[_whitelistAddress] = whitelisted;
        excludeFromFees(_whitelistAddress, whitelisted);
        if (whitelisted) {
            dividendTracker.excludeFromDividends(_whitelistAddress);
        } else {
            dividendTracker.includeInDividends(_whitelistAddress);
        }
    }

    function updateDividendTracker(address newAddress) external override onlyOwner {
        require(newAddress != address(0), 'TetherMoon: Dividend tracker not yet initialized');
        require(newAddress != address(dividendTracker), 'TetherMoon: The dividend tracker already has that address');

        ITetherMoonDividendTracker newDividendTracker = ITetherMoonDividendTracker(payable(newAddress));
        require(
            newDividendTracker.getOwner() == address(this),
            'TetherMoon: The new dividend tracker must be owned by the TetherMoon token contract'
        );

        setWhitelistAddress(address(newDividendTracker), true);
        dividendTracker = newDividendTracker;
        emit UpdateDividendTracker(newAddress, address(dividendTracker));
    }

    function addNewRouter(address _router, bool makeDefault) external override onlyOwner {
        dexRouters[_router] = true;
        dividendTracker.excludeFromDividends(_router);

        if (makeDefault) {
            emit UpdateDefaultDexRouter(_router, address(defaultDexRouter));
            defaultDexRouter = IDEXRouter(_router);
            defaultPair = IDEXFactory(defaultDexRouter.factory()).createPair(address(this), defaultDexRouter.WETH());
            _setAutomatedMarketMakerPair(defaultPair, true);
        }
    }

    function excludeFromFees(address account, bool excluded) public override onlyOwner {
        require(_isExcludedFromFees[account] != excluded, "TetherMoon: Account is already the value of 'excluded'");
        _isExcludedFromFees[account] = excluded;
        emit ExcludeFromFees(account, excluded);
    }

    function excludeMultipleAccountsFromFees(address[] calldata accounts, bool excluded) external override onlyOwner {
        for (uint256 i = 0; i < accounts.length; i++) {
            excludeFromFees(accounts[i], excluded);
        }
    }

    function setAutomatedMarketMakerPair(address pair, bool value) external override onlyOwner {
        require(
            value || pair != defaultPair,
            'TetherMoon: The default pair cannot be removed from automatedMarketMakerPairs'
        );
        _setAutomatedMarketMakerPair(pair, value);
    }

    function _setAutomatedMarketMakerPair(address pair, bool value) private {
        require(
            automatedMarketMakerPairs[pair] != value,
            'TetherMoon: Automated market maker pair is already set to that value'
        );

        automatedMarketMakerPairs[pair] = value;
        if (value && address(dividendTracker) != address(0)) dividendTracker.excludeFromDividends(pair);
        emit SetAutomatedMarketMakerPair(pair, value);
    }

    function updateMinTokenBalance(uint256 minTokens) external override onlyOwner {
        dividendTracker.updateMinTokenBalance(minTokens);
    }

    function updateMarketingWallet(address newMarketingWallet) external override onlyOwner {
        require(newMarketingWallet != marketingWallet, 'TetherMoon: The marketing wallet is already this address');
        setWhitelistAddress(newMarketingWallet, true);
        emit marketingWalletUpdated(newMarketingWallet, marketingWallet);
        marketingWallet = newMarketingWallet;
    }

    function updateLiquidityWallet(address newLiquidityWallet) external override onlyOwner {
        require(newLiquidityWallet != liquidityWallet, 'TetherMoon: The liquidity wallet is already this address');
        setWhitelistAddress(newLiquidityWallet, true);
        emit LiquidityWalletUpdated(newLiquidityWallet, liquidityWallet);
        liquidityWallet = newLiquidityWallet;
    }

    function updateGasForProcessing(uint256 newValue) external override onlyOwner {
        require(
            newValue >= 200000 && newValue <= 500000,
            'TetherMoon: gasForProcessing must be between 200,000 and 500,000'
        );
        require(newValue != gasForProcessing, 'TetherMoon: Cannot update gasForProcessing to same value');
        emit GasForProcessingUpdated(newValue, gasForProcessing);
        gasForProcessing = newValue;
    }

    function updateClaimWait(uint256 claimWait) external override onlyOwner {
        dividendTracker.updateClaimWait(claimWait);
    }

    function getClaimWait() external view override returns (uint256) {
        return dividendTracker.claimWait();
    }

    function getTotalDividendsDistributed() external view override returns (uint256) {
        return dividendTracker.totalDividendsDistributed();
    }

    function isExcludedFromFees(address account) external view override returns (bool) {
        return _isExcludedFromFees[account];
    }

    function withdrawableDividendOf(address account) external view override returns (uint256) {
        return dividendTracker.withdrawableDividendOf(account);
    }

    function dividendTokenBalanceOf(address account) external view override returns (uint256) {
        return dividendTracker.balanceOf(account);
    }

    function getAccountDividendsInfo(address account)
        external
        view
        override
        returns (
            address,
            int256,
            int256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return dividendTracker.getAccount(account);
    }

    function getAccountDividendsInfoAtIndex(uint256 index)
        external
        view
        override
        returns (
            address,
            int256,
            int256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return dividendTracker.getAccountAtIndex(index);
    }

    function processDividendTracker(uint256 gas) external override {
        (uint256 iterations, uint256 claims, uint256 lastProcessedIndex) = dividendTracker.process(gas);
        emit ProcessedDividendTracker(iterations, claims, lastProcessedIndex, false, gas, tx.origin);
    }

    function claim() external override {
        dividendTracker.processAccount(payable(msg.sender), false);
    }

    function getLastProcessedIndex() external view override returns (uint256) {
        return dividendTracker.getLastProcessedIndex();
    }

    function getNumberOfDividendTokenHolders() external view override returns (uint256) {
        return dividendTracker.getNumberOfTokenHolders();
    }

    /**
     * Enable or disable transfers, used before presale and on critical problems in or with the token contract
     */
    function setTransfersEnabled(bool enabled) external override onlyOwner {
        transfersEnabled = enabled;
    }

    function updateBuyFees(
        uint256 _dividendFee,
        uint256 _liquidityFee,
        uint256 _marketingFee
    ) external override onlyOwner {
        buyDividendFee = _dividendFee;
        buyLiquidityFee = _liquidityFee;
        buyMarketingFee = _marketingFee;
        buyTotalFees = buyDividendFee + buyLiquidityFee + buyMarketingFee;
        require(buyTotalFees <= 5000, 'Max fee  is 50%');
    }

    function updateSellFees(
        uint256 _dividendFee,
        uint256 _liquidityFee,
        uint256 _marketingFee
    ) external override onlyOwner {
        sellDividendFee = _dividendFee;
        sellLiquidityFee = _liquidityFee;
        sellMarketingFee = _marketingFee;
        sellTotalFees = sellDividendFee + sellLiquidityFee + sellMarketingFee;
        require(sellTotalFees <= 5000, 'Max fee is 50%');
    }

    function updateSwapTokensAtAmount(uint256 _swapTokensAtAmount) external override onlyOwner {
        require(_swapTokensAtAmount > 0, 'TetherMoon: Amount should be higher then 0');
        require(_swapTokensAtAmount <= 100 * (10**12) * (10**18), 'TetherMoon: Max should be at 10%');
        swapTokensAtAmount = _swapTokensAtAmount;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        require(from != address(0), 'ERC20: transfer from the zero address');
        require(to != address(0), 'ERC20: transfer to the zero address');

        // when NOT from or to owner, to burn address or to dex pair
        // check if target wallet exeeds the maxWalletPAirs
        if (
            from != owner() &&
            to != owner() &&
            to != address(0) &&
            to != 0x000000000000000000000000000000000000dEaD &&
            !automatedMarketMakerPairs[to]
        ) {
            uint256 contractBalanceRecepient = balanceOf(to);
            require(
                contractBalanceRecepient + amount <= maxWalletToken,
                'TetherMoon: Exceeds maximum wallet token amount.'
            );
        }

        // only whitelisted addresses can make transfers when transfers are disabled
        if (!transfersEnabled) {
            require(whitelistedAddresses[from], 'TetherMoon: Transfering is disabled');
        }

        if (amount == 0) {
            super._transfer(from, to, 0);
            return;
        }

        uint256 senderBalance = balanceOf(from);
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");

        // take fee
        amount = collectFees(from, to, amount);

        if (address(dividendTracker) != address(0)) {
            try dividendTracker.setBalance(payable(from), balanceOf(from) - amount) {} catch {}
            try dividendTracker.setBalance(payable(to), balanceOf(to) + amount) {} catch {}
        }

        // swap fees before transfer has happened and after dividend balances are done
        swapFeesIfAmountIsReached(from, to);

        super._transfer(from, to, amount);

        if (address(dividendTracker) != address(0) && !isSwappingFees) {
            uint256 gas = gasForProcessing;

            try dividendTracker.process(gas) returns (uint256 iterations, uint256 claims, uint256 lastProcessedIndex) {
                emit ProcessedDividendTracker(iterations, claims, lastProcessedIndex, true, gas, tx.origin);
            } catch {}
        }
    }

    function collectFees(
        address from,
        address to,
        uint256 amount
    ) private returns (uint256) {
        if (!isSwappingFees && !_isExcludedFromFees[from] && !_isExcludedFromFees[to]) {
            uint256 fees;
            if (automatedMarketMakerPairs[from]) {
                fees = (amount * buyTotalFees) / 10000;
                buyFeesCollected += fees;
            } else if (automatedMarketMakerPairs[to]) {
                fees = (amount * sellTotalFees) / 10000;
                sellFeesCollected += fees;
            }

            amount = amount - fees;
            super._transfer(from, address(this), fees);
        }
        return amount;
    }

    function swapFeesIfAmountIsReached(address from, address to) private {
        uint256 contractTokenBalance = balanceOf(address(this));
        
        if (
            contractTokenBalance >= swapTokensAtAmount &&
            !isSwappingFees &&
            !automatedMarketMakerPairs[from] && // do not swap fees on buys
            from != liquidityWallet &&
            to != liquidityWallet
        ) {
            isSwappingFees = true;

            buyFeesCollected = (contractTokenBalance / (buyFeesCollected + sellFeesCollected)) * buyFeesCollected;
            sellFeesCollected = contractTokenBalance - buyFeesCollected;

            uint256 marketingTokens = (buyFeesCollected * buyMarketingFee) / buyTotalFees;
            marketingTokens += (sellFeesCollected * sellMarketingFee) / sellTotalFees;
            if (marketingTokens > 0) swapAndSendToFee(marketingTokens);

            uint256 swapTokens = (buyFeesCollected * buyLiquidityFee) / buyTotalFees;
            swapTokens = (sellFeesCollected * sellLiquidityFee) / sellTotalFees;
            if (swapTokens > 0) swapAndLiquify(swapTokens);

            uint256 sellTokens = balanceOf(address(this));
            if (sellTokens > 0) swapAndSendDividends(sellTokens);

            buyFeesCollected = 0;
            sellFeesCollected = 0;

            isSwappingFees = false;
        }
    }

    function swapAndSendToFee(uint256 tokens) private {
        uint256 initialBNBBalance = address(this).balance;
        swapTokensForEth(tokens);
        uint256 newBNBBalance = address(this).balance - initialBNBBalance;
        payable(marketingWallet).transfer(newBNBBalance);
    }

    function swapAndLiquify(uint256 tokens) private {
        // split the contract balance into halves
        uint256 half = tokens / 2;
        uint256 otherHalf = tokens - half;

        // capture the contract's current ETH balance.
        // this is so that we can capture exactly the amount of ETH that the
        // swap creates, and not make the liquidity event include any ETH that
        // has been manually sent to the contract
        uint256 initialBalance = address(this).balance;

        // swap tokens for ETH
        swapTokensForEth(half); // <- this breaks the ETH -> HATE swap when swap+liquify is triggered

        // how much ETH did we just swap into?
        uint256 newBalance = address(this).balance - initialBalance;

        // add liquidity to uniswap
        addLiquidity(otherHalf, newBalance);

        emit SwapAndLiquify(half, newBalance, otherHalf);
    }

    function swapTokensForEth(uint256 tokenAmount) private {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = defaultDexRouter.WETH();

        _approve(address(this), address(defaultDexRouter), tokenAmount);

        // make the swap
        defaultDexRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        // approve token transfer to cover all possible scenarios
        _approve(address(this), address(defaultDexRouter), tokenAmount);

        // add the liquidity
        defaultDexRouter.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            liquidityWallet,
            block.timestamp
        );
    }

    function swapAndSendDividends(uint256 tokens) private {
        swapTokensForUSDT(tokens, address(this));
        uint256 dividends = IERC20(USDT).balanceOf(address(this));
        bool success = IERC20(USDT).transfer(address(dividendTracker), dividends);

        if (success) {
            dividendTracker.distributeDividends(dividends);
            emit SendDividends(tokens, dividends);
        }
    }

    function swapTokensForUSDT(uint256 tokenAmount, address recipient) private {
        // generate the uniswap pair path of weth -> USDT
        address[] memory path = new address[](3);
        path[0] = address(this);
        path[1] = defaultDexRouter.WETH();
        path[2] = USDT;

        _approve(address(this), address(defaultDexRouter), tokenAmount);

        // make the swap
        defaultDexRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of USDT
            path,
            recipient,
            block.timestamp
        );
    }
}
