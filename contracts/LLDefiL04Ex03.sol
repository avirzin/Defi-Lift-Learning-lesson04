// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LLDefiL04Ex03 is ERC20 {

    //Constants
    uint256 public LOCKING_PERIOD = 1672531200; // Date:01-01-2023 - 00:00:00 GMT
    address public contractOwner;

    // Constructor
    constructor() ERC20("LLDefiL04Ex03", "X03") {
        contractOwner = msg.sender;
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Check if the token is transferable
    modifier checkBlock() {
        require(msg.sender == contractOwner || block.timestamp > LOCKING_PERIOD, 'Token is only transferable from 01-01-2023 - 00:00:00 (GMT)');
        _; // Execute the function after the statement above
    }

    // Transfer function
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    // TransferFrom function
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        _spendAllowance(from, _msgSender(), amount);
        _transfer(from, to, amount);
        return true;
    }

    
}