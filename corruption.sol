pragma solidity ^0.6.0;

contract CorruptedState {
  struct OwnedTokens {
	uint owned;
	uint promised;
  }

  mapping (address => OwnedTokens) ownership;

  function corruptMemory(uint sz, uint elem) public returns (uint256) {
	uint[] memory tmp = new uint[](sz);
	OwnedTokens memory t = ownership[msg.sender];
	tmp[2] = elem;
	ownership[msg.sender] = t;
	return ownership[msg.sender].owned;
  }

  function getOwned() public returns (uint256) {
	return ownership[msg.sender].owned;
  }
}
