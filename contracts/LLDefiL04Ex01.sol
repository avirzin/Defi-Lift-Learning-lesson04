// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LLDefiL04Ex01 is ERC20 {
    constructor() ERC20("LLDefiL04Ex01", "X01") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}