// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; // Define that this contract is ownable
import "hardhat/console.sol";

// Same structure as in Exercise 01
contract LLDefiL04Ex04 is ERC20, Ownable  {
    constructor() ERC20("LLDefiL04Ex04", "X04") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
      _mint(to, amount);
    }
}