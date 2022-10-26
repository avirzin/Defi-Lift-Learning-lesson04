// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LLDefiL04Ex02 is ERC20 {

    // Constructor
    constructor() ERC20("LLDefiL04Ex02", "X02") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Transfer function
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        uint burnAmount = amount * 5 / 100; //considering 5% burn rate
        _burn(_msgSender(), burnAmount);
        _transfer(_msgSender(), recipient, amount-burnAmount);
        return true;
    }

    // TransferFrom function
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        //address spender = _msgSender();
        uint burnAmount = amount * 5 / 100; //considering 5% burn rate
        _spendAllowance(from, _msgSender(), amount);
        _burn(_msgSender(), burnAmount);
        _transfer(from, to, amount - burnAmount);
        return true;
    }

    
}