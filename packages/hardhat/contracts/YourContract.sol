pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  // event SetPurpose(address sender, string purpose);

  address public dan = 0xf6fbF136c1D6470B891930e35D67F9a9111ED743;

  string public purpose = "Building Unstoppable Apps!!!";

  // Mapping from addresses to uint
  mapping(address => uint) public balances;

  constructor() payable {
    // what should we do on deploy?
    //setting balance mapping of Dan address to 100 ether
    balances[dan] =  100;
  }

  //function to send ether from address to designated address
  function transfer(address to, uint256 amount) public {
    balances[msg.sender] -= amount;
    balances[to] += amount;
  }

  function setPurpose(string memory newPurpose) public payable{
      // Require the sender to be the DAN contract address
      require(msg.sender==dan, "NOT THE OWNER!");
      // Also require the sender to have 0.001 ether
      require( msg.value >= 0.001 ether, "NOT ENOUGH ETHER!!");
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      // emit SetPurpose(msg.sender, purpose);
  }

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}