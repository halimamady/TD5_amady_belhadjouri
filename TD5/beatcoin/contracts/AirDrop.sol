pragma solidity ^0.4.25;

import "./IERC20.sol";

contract Ownable {
  address public owner;

  function _Ownable() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if (msg.sender != owner) {
      revert();
    }
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    if (newOwner != address(0)) {
      owner = newOwner;
    }
  }
}

contract MultiLevelDistribution_AirDrop is Ownable {

    function MultiLevelDistribution(address _tokenAddr, address[] dests, uint256[] values)public onlyOwner returns (uint256) {
        uint256 i = 0;
        while (i < dests.length) {
           IERC20(_tokenAddr).transfer(dests[i], values[i]);
           i += 1;
        }
        return(i);
    }

    function AirDrop ( address receiver, uint256 value) public {
      address _tokenAddr = 0x7F71f62cA15Daf0d89186f0510F069fab84569a4; //address of my token
      IERC20(_tokenAddr).transfer(receiver, value);
  }

}