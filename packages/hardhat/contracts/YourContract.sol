pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  // event SetPurpose(address sender, string purpose);

  string public purpose = "Dan Wu Building Unstoppable Apps!!";

  constructor() payable {
    // what should we do on deploy?
  }

  address public owner = 0xf6fbF136c1D6470B891930e35D67F9a9111ED743;

  function setPurpose(string memory newPurpose) public payable {
      require( msg.value == 0.001 ether, "NOT ENOUGH");
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      // emit SetPurpose(msg.sender, purpose);
  }

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}

function withdraw() public {
  require( msg.sender == owner, "NOT OWNER");
  (bool success, ) = owner.call{value: address(this).balance}("");
  require( success, "FAILED");
}

}
