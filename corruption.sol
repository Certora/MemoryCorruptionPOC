pragma solidity ^0.6.0;

contract CorruptedState {
  struct OwnedTokens {
	uint owned;
	uint promised;
  }

  mapping (address => OwnedTokens) ownership;

  // The following method allocates a memory array of uint256s of length `sz`. (Line 1)
  // The length of the memory array in *bytes* is therefore sz * 32.
  // If sz is large enough, the length in bytes not be representable in a uint256 and will overflow,
  // resulting in a small number of bytes actually being allocated from the free memory pointer.
  // Thus the length in elements stored in the first word of the array will not agree with the
  // number of bytes actually allocated.
  // Line 2 then copies struct into memory "after" the end of tmp (which, since only a few bytes
  // were allocated, is actually to somewhere in the middle of tmp).
  // Line 3 is a seemingly innocuous write to tmp, which can actually affect the struct t if sz
  // is chosen correctly.
  // Line 4 copies t back to storage.
  function corruptMemory(uint sz, uint elem) public returns (uint256) {
    /* 1 */  uint[] memory tmp = new uint[](sz);
	/* 2 */  OwnedTokens memory t = ownership[msg.sender];
	/* 3 */  tmp[2] = elem;
	/* 4 */  ownership[msg.sender] = t;
	/* 5 */  return ownership[msg.sender].owned;
  }

  function getOwned() public returns (uint256) {
	return ownership[msg.sender].owned;
  }
}
