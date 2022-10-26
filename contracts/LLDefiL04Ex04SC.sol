// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./LLDefiL04Ex04.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "hardhat/console.sol";

contract LLDefiL04Ex04SC is Ownable {

  LLDefiL04Ex04 lLDefiL04Ex04;  // Exercise 4 ownable contract (token)

  uint256 public tokensPerMatic = 100;  // Tokens price for MATIC

  event BuyTokens(address buyer, uint256 amountOfMatic, uint256 amountOfTokens);

  //Constructs the token 
  constructor(address tokenAddress) {
    lLDefiL04Ex04 = LLDefiL04Ex04(tokenAddress);
  }


  //buyTokens function 
  function buyTokens() public payable returns (uint256 tokenAmount) {
    require(msg.value > 0, "Send MATIC to buy some tokens");

    uint256 amountToBuy = msg.value * tokensPerMatic;

     // Verify if the vendor contract has enough tokens
    uint256 SellerBalance = lLDefiL04Ex04.balanceOf(address(this));
    require(SellerBalance >= amountToBuy, "Vendor contract has not enough tokens in its balance");
    (bool sent) = lLDefiL04Ex04.transfer(msg.sender, amountToBuy); // Transfer token to the Msg.Sender
    require(sent, "Failed to transfer token to user");

    emit BuyTokens(msg.sender, msg.value, amountToBuy); // emit the event

    return amountToBuy;
  }

  // Allow the owner of the contract to withdraw MATIC
  function withdraw() public onlyOwner {
    uint256 ownerBalance = address(this).balance;
    require(ownerBalance > 0, "Owner has not balance to withdraw");

    (bool sent,) = msg.sender.call{value: address(this).balance}("");
    require(sent, "Failed to send user balance back to the owner");
  }
}