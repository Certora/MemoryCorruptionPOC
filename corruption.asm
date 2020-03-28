======= corruption.sol:CorruptedState =======
EVM assembly:
  mstore(0x40, 0x80)
  callvalue
  dup1
  iszero
  tag_1
  jumpi
  0x00
  dup1
  revert
tag_1:
  pop
  dataSize(sub_0)
  dup1
  dataOffset(sub_0)
  0x00
  codecopy
  0x00
  return
stop

sub_0: assembly {
      mstore(0x40, 0x80)
      callvalue
      // stack: callvalue
      dup1
      // stack: callvalue callvalue
      iszero
      // stack: callvalue callvalue==0
      tag_1
      // stack: callvalue callvalue==0 tag_1
      jumpi
      0x00
      dup1
      revert
    tag_1:
      // stack: callvalue
      pop
      // stack:
      jumpi(tag_2, lt(calldatasize, 0x04))
      // stack:
      shr(0xe0, calldataload(0x00))
      // stack: selector
      dup1
      // stack: selector selector
      0x9f94c670 // selector of corruptMemory
      // stack: selector selector 0x9f94c670
      eq
      // stack: selector selector==0x9f94c670
      tag_3
      // stack: selector selector==0x9f94c670 tag_3
      jumpi
      // stack: selector
      dup1
      // stack: selector selector
      0xc3027525  // selector of getOwned
      // stack: selector selector 0xc3027525
      eq
      // stack: selector selector==0xc3027525
      tag_4
      // stack: selector selector==0xc3027525 tag4
      jumpi
      // stack: selector
    tag_2:
      // stack: selector
      0x00
      // stack: selector 0
      dup1
      // stack: selector 0 0
      revert
    tag_3:
      // stack: selector
      tag_5
      // stack: selector tag_5
      0x04
      // stack: selector tag_5 4
      dup1
      // stack: selector tag_5 4 4
      calldatasize
      // stack: selector tag_5 4 4 calldatasize
      sub
      // stack: selector tag_5 4 calldatasize-4
      0x40
      // stack: selector tag_5 4 calldatasize-4 0x40
      dup2
      // stack: selector tag_5 4 calldatasize-4 0x40 calldatasize-4
      lt
      // stack: selector tag_5 4 calldatasize-4 calldatasize-4<0x40
      iszero
      tag_6
      jumpi
      0x00
      dup1
      revert
    tag_6:
      // stack: selector tag_5 4 calldatasize-4
      dup2
      // stack: selector tag_5 4 calldatasize-4 4
      add
      // stack: selector tag_5 4 calldatasize
      swap1
      // stack: selector tag_5 calldatasize 4
      dup1
      // stack: selector tag_5 calldatasize 4 4
      dup1
      // stack: selector tag_5 calldatasize 4 4 4
      calldataload
      // stack: selector tag_5 calldatasize 4 4 calldata[4:4+32]
      // Note: calldata[4:4+32] is sz
      swap1
      // stack: selector tag_5 calldatasize 4 sz 4
      0x20
      // stack: selector tag_5 calldatasize 4 sz 4 0x20
      add
      // stack: selector tag_5 calldatasize 4 sz 0x24
      swap1
      // stack: selector tag_5 calldatasize 4 0x24 sz
      swap3
      // stack: selector tag_5 sz 4 0x24 calldatasize
      swap2
      // stack: selector tag_5 sz calldatasize 0x24 4
      swap1
      // stack: selector tag_5 sz calldatasize 4 0x24
      dup1
      // stack: selector tag_5 sz calldatasize 4 0x24 0x24
      calldataload
      // stack: selector tag_5 sz calldatasize 4 0x24 calldata[0x24:0x24+4]
      // Note: calldata[0x24:0x24+4] is elem
      swap1
      // stack: selector tag_5 sz calldatasize 4 elem 0x24
      0x20
      // stack: selector tag_5 sz calldatasize 4 elem 0x24 0x20
      add
      // stack: selector tag_5 sz calldatasize 4 elem 0x44
      swap1
      // stack: selector tag_5 sz calldatasize 4 0x44 elem
      swap3
      // stack: selector tag_5 sz elem 4 0x44 calldatasize
      swap2
      // stack: selector tag_5 sz elem calldatasize 0x44 4
      swap1
      // stack: selector tag_5 sz elem calldatasize 4 0x44
      pop
      // stack: selector tag_5 sz elem calldatasize 4
      pop
      // stack: selector tag_5 sz elem calldatasize
      pop
      // stack: selector tag_5 sz elem
      tag_7
      jump	// in
    tag_5:
      // stack: selector ownership[msg.sender].owned
      mload(0x40)  // load freeptr for scratch space for return value
      // stack: selector ownership[msg.sender].owned scratch
      dup1
      // stack: selector ownership[msg.sender].owned scratch scratch
      dup3
      // stack: selector ownership[msg.sender].owned scratch scratch ownership[msg.sender].owned
      dup2
      // stack: selector ownership[msg.sender].owned scratch scratch ownership[msg.sender].owned scratch
      mstore  // m[scratch] = ownership[msg.sender].owned
      // stack: selector ownership[msg.sender].owned scratch scratch
      0x20
      // stack: selector ownership[msg.sender].owned scratch scratch 0x20
      add
      // stack: selector ownership[msg.sender].owned scratch scratch+0x20
      swap2
      // stack: selector scratch+0x20 scratch ownership[msg.sender].owned
      pop
      // stack: selector scratch+0x20 scratch
      pop
      // stack: selector scratch+0x20
      mload(0x40)
      // stack: selector scratch+0x20 scratch
      dup1
      // stack: selector scratch+0x20 scratch scratch
      swap2
      // stack: selector scratch scratch scratch+0x20
      sub
      // stack: selector scratch 0x20
      swap1
      // stack: selector 0x20 scratch
      return  // return m[scratch:scratch+0x20]
    tag_4:
      tag_8
      tag_9
      jump	// in
    tag_8:
      mload(0x40)
      dup1
      dup3
      dup2
      mstore
      0x20
      add
      swap2
      pop
      pop
      mload(0x40)
      dup1
      swap2
      sub
      swap1
      return
    tag_7:
      // stack: selector tag_5 sz elem
      0x00
      // stack: selector tag_5 sz elem 0
      0x60
      // stack: selector tag_5 sz elem 0 0x60
      dup4
      // stack: selector tag_5 sz elem 0 0x60 sz
      mload(0x40)  // load the freeptr, which will be the address of tmp
      // stack: selector tag_5 sz elem 0 0x60 sz tmp
      swap1
      // stack: selector tag_5 sz elem 0 0x60 tmp sz
      dup1
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz
      dup3
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz tmp
      mstore  // write sz to the first free word (the length of the array (in elements, not bytes) is stored in the array's first word)
      // stack: selector tag_5 sz elem 0 0x60 tmp sz
      dup1
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz
      0x20
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz 0x20
      mul
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz*0x20
      0x20
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz*0x20 0x20
      add
      // stack: selector tag_5 sz elem 0 0x60 tmp sz (sz*0x20)+0x20
      dup3
      // stack: selector tag_5 sz elem 0 0x60 tmp sz (sz*0x20)+0x20 tmp
      add
      // stack: selector tag_5 sz elem 0 0x60 tmp sz (sz*0x20)+0x20+tmp
      0x40
      // stack: selector tag_5 sz elem 0 0x60 tmp sz (sz*0x20)+0x20+tmp 0x40
      mstore  // new free pointer is now (sz*0x20)+0x20+tmp
      // stack: selector tag_5 sz elem 0 0x60 tmp sz
      dup1
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz
      iszero
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz==0
      tag_11
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz==0 tag_11
      jumpi  // skip initialization if length 0
      // stack: selector tag_5 sz elem 0 0x60 tmp sz
      dup2
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp
      0x20
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp 0x20
      add
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20
      0x20
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 0x20
      dup3
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 0x20 sz
      mul
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 sz*0x20
      dup1
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 sz*0x20 sz*0x20
      codesize
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 sz*0x20 sz*0x20 codesize
      dup4
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 sz*0x20 sz*0x20 codesize tmp+0x20
      codecopy  // zero-initialize by copying from past the end of code
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 sz*0x20
      dup1
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 sz*0x20 sz*0x20
      dup3
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 sz*0x20 sz*0x20 tmp+0x20
      add
      // stack: selector tag_5 sz elem 0 0x60 tmp sz tmp+0x20 sz*0x20 sz*0x20+tmp+0x20
      swap2
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz*0x20+tmp+0x20 sz*0x20 tmp+0x20
      pop
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz*0x20+tmp+0x20 sz*0x20
      pop
      // stack: selector tag_5 sz elem 0 0x60 tmp sz sz*0x20+tmp+0x20
      swap1
      // stack: selector tag_5 sz elem 0 0x60 tmp sz*0x20+tmp+0x20 sz
      pop
      // stack: selector tag_5 sz elem 0 0x60 tmp sz*0x20+tmp+0x20
    tag_11:
      pop
      // stack: selector tag_5 sz elem 0 0x60 tmp
      swap1
      // stack: selector tag_5 sz elem 0 tmp 0x60
      pop
      // stack: selector tag_5 sz elem 0 tmp
      tag_12
      // stack: selector tag_5 sz elem 0 tmp tag_12
      tag_13
      // stack: selector tag_5 sz elem 0 tmp tag_12 tag_13
      jump	// in
    tag_12:
      // stack: selector tag_5 sz elem 0 tmp xxx
      0x00
      // stack: selector tag_5 sz elem 0 tmp xxx 0
      dup1
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0
      caller
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0 msg.sender
      0xffffffffffffffffffffffffffffffffffffffff
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0 msg.sender mask160
      and
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0 msg.sender&mask160
      0xffffffffffffffffffffffffffffffffffffffff
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0 msg.sender&mask160 mask160
      and  // nop?
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0 msg.sender&mask160
      dup2
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0 msg.sender&mask160 0
      mstore  // m[0] = msg.sender
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0
      0x20
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp xxx 0 0x20
      swap1
      // stack: selector tag_5 sz elem 0 tmp xxx 0x20 0
      dup2
      // stack: selector tag_5 sz elem 0 tmp xxx 0x20 0 0x20
      mstore m[0x20] = 0
      // stack: selector tag_5 sz elem 0 tmp xxx 0x20
      0x20
      // stack: selector tag_5 sz elem 0 tmp xxx 0x20 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp xxx 0x40
      0x00
      // stack: selector tag_5 sz elem 0 tmp xxx 0x40 0
      keccak256  // hash(msg.sender,0), which is the base storage address of ownership[msg.sender]
      // stack: selector tag_5 sz elem 0 tmp xxx ownership[msg.sender]
      mload(0x40)  // load the freeptr, which will be the address of t
      // stack: selector tag_5 sz elem 0 tmp xxx ownership[msg.sender] t
      dup1
      // stack: selector tag_5 sz elem 0 tmp xxx ownership[msg.sender] t t
      0x40
      // stack: selector tag_5 sz elem 0 tmp xxx ownership[msg.sender] t t 0x40
      add
      // stack: selector tag_5 sz elem 0 tmp xxx ownership[msg.sender] t t+0x40
      0x40
      // stack: selector tag_5 sz elem 0 tmp xxx ownership[msg.sender] t t+0x40 0x40
      mstore  // new freeptr is freeptr+0x40
      // stack: selector tag_5 sz elem 0 tmp xxx ownership[msg.sender] t
      swap1
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender]
      dup2
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t
      0x00
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t 0
      dup3
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t 0 ownership[msg.sender]
      add
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t ownership[msg.sender]
      sload  // sload(ownership[msg.sender]+0) where 0 is the slot index of field owned in struct OwnedTokens
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t ownership[msg.sender].owned
      dup2
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t ownership[msg.sender].owned t
      mstore  // t.owned = ownership[msg.sender].owned
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t
      0x20
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t+0x20
      0x01
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t+0x20 1
      dup3
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t+0x20 1 ownership[msg.sender]
      add
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t+0x20 ownership[msg.sender]+1
      sload  // sload(ownership[msg.sender]+1) where 1 is the slot index of field promised in struct OwnedTokens
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t+0x20 ownership[msg.sender].promised
      dup2
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t+0x20 ownership[msg.sender].promised t+0x20
      mstore  // t.promised = ownership[msg.sender].promised
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender] t+0x20
      pop
      // stack: selector tag_5 sz elem 0 tmp xxx t ownership[msg.sender]
      pop
      // stack: selector tag_5 sz elem 0 tmp xxx t
      swap1
      // stack: selector tag_5 sz elem 0 tmp t xxx
      pop
      // stack: selector tag_5 sz elem 0 tmp t
      dup4
      // stack: selector tag_5 sz elem 0 tmp t elem
      dup3
      // stack: selector tag_5 sz elem 0 tmp t elem tmp
      0x02
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2
      dup2
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2 tmp
      mload
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2 tmp.length
      dup2
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2 tmp.length 2
      lt
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2 2<tmp.length
      tag_14
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2 2<tmp.length tag_14
      jumpi
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2
      invalid
    tag_14:
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2
      0x20
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 2 0x20
      mul
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 0x40
      0x20
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 0x40 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp t elem tmp 0x60
      add
      // stack: selector tag_5 sz elem 0 tmp t elem tmp+0x60
      dup2
      // stack: selector tag_5 sz elem 0 tmp t elem tmp+0x60 elem
      dup2
      // stack: selector tag_5 sz elem 0 tmp t elem tmp+0x60 elem tmp+0x60
      mstore   // tmp[2] = elem  (note that tmp+0x60 is the memory address of tmp[2] in bytes (tmp plus one word for length, plus 2 words of elements))
      // stack: selector tag_5 sz elem 0 tmp t elem tmp+0x60
      pop
      // stack: selector tag_5 sz elem 0 tmp t elem
      pop
      // stack: selector tag_5 sz elem 0 tmp t
      dup1
      // stack: selector tag_5 sz elem 0 tmp t t
      0x00
      // stack: selector tag_5 sz elem 0 tmp t t 0
      dup1
      // stack: selector tag_5 sz elem 0 tmp t t 0 0
      caller
      // stack: selector tag_5 sz elem 0 tmp t t 0 0 msg.sender
      0xffffffffffffffffffffffffffffffffffffffff
      // stack: selector tag_5 sz elem 0 tmp t t 0 0 msg.sender mask160
      and
      // stack: selector tag_5 sz elem 0 tmp t t 0 0 msg.sender&mask160
      0xffffffffffffffffffffffffffffffffffffffff
      // stack: selector tag_5 sz elem 0 tmp t t 0 0 msg.sender&mask160 mask160
      and  // nop?
      // stack: selector tag_5 sz elem 0 tmp t t 0 0 msg.sender&mask160
      dup2
      // stack: selector tag_5 sz elem 0 tmp t t 0 0 msg.sender&mask160 0
      mstore  // m[0] = msg.sender
      // stack: selector tag_5 sz elem 0 tmp t t 0 0
      0x20
      // stack: selector tag_5 sz elem 0 tmp t t 0 0 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp t t 0 0x20
      swap1
      // stack: selector tag_5 sz elem 0 tmp t t 0x20 0
      dup2
      // stack: selector tag_5 sz elem 0 tmp t t 0x20 0 0x20
      mstore  // m[0x20] = 0
      // stack: selector tag_5 sz elem 0 tmp t t 0x20
      0x20
      // stack: selector tag_5 sz elem 0 tmp t t 0x20 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp t t 0x40
      0x00
      // stack: selector tag_5 sz elem 0 tmp t t 0x40 0
      keccak256  // hash(msg.sender,0) which is the base storage address of ownership[msg.sender]
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender]
      0x00
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] 0
      dup3
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] 0 t
      add
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t
      mload
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t.owned
      dup2
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t.owned ownership[msg.sender]
      0x00
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t.owned ownership[msg.sender] 0
      add
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t.owned ownership[msg.sender]
      sstore  // ownership[msg.sender].owned = t.owned
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender]
      0x20
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] 0x20
      dup3
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] 0x20 t
      add
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t+0x20
      mload
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t.promised
      dup2
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t.promised ownership[msg.sender]
      0x01
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t.promised ownership[msg.sender] 1
      add
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender] t.promised ownership[msg.sender]+1
      sstore  // ownership[msg.sender].promised = t.promised
      // stack: selector tag_5 sz elem 0 tmp t t ownership[msg.sender]
      swap1
      // stack: selector tag_5 sz elem 0 tmp t ownership[msg.sender] t
      pop
      // stack: selector tag_5 sz elem 0 tmp t ownership[msg.sender]
      pop
      // stack: selector tag_5 sz elem 0 tmp t
      0x00
      // stack: selector tag_5 sz elem 0 tmp t 0
      dup1
      // stack: selector tag_5 sz elem 0 tmp t 0 0
      caller
      // stack: selector tag_5 sz elem 0 tmp t 0 0 msg.sender
      0xffffffffffffffffffffffffffffffffffffffff
      // stack: selector tag_5 sz elem 0 tmp t 0 0 msg.sender mask160
      and
      // stack: selector tag_5 sz elem 0 tmp t 0 0 msg.sender&mask160
      0xffffffffffffffffffffffffffffffffffffffff
      // stack: selector tag_5 sz elem 0 tmp t 0 0 msg.sender&mask160 mask160
      and // nop?
      // stack: selector tag_5 sz elem 0 tmp t 0 0 msg.sender&mask160
      dup2
      // stack: selector tag_5 sz elem 0 tmp t 0 0 msg.sender&mask160 0
      mstore  // m[0] = msg.sender
      // stack: selector tag_5 sz elem 0 tmp t 0 0
      0x20
      // stack: selector tag_5 sz elem 0 tmp t 0 0 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp t 0 0x20
      swap1
      // stack: selector tag_5 sz elem 0 tmp t 0x20 0
      dup2
      // stack: selector tag_5 sz elem 0 tmp t 0x20 0 0x20
      mstore  // m[0x20] = 0
      // stack: selector tag_5 sz elem 0 tmp t 0x20
      0x20
      // stack: selector tag_5 sz elem 0 tmp t 0x20 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp t 0x40
      0x00
      // stack: selector tag_5 sz elem 0 tmp t 0x40 0
      keccak256  // hash(msg.sender, 0) which is the base storage address of ownership[msg.sender]
      // stack: selector tag_5 sz elem 0 tmp t ownership[msg.sender]
      0x00
      // stack: selector tag_5 sz elem 0 tmp t ownership[msg.sender] 0
      add
      // stack: selector tag_5 sz elem 0 tmp t ownership[msg.sender]
      sload  // ownership[msg.sender].owned
      // stack: selector tag_5 sz elem 0 tmp t ownership[msg.sender].owned
      swap3
      // stack: selector tag_5 sz elem ownership[msg.sender].owned tmp t 0
      pop
      // stack: selector tag_5 sz elem ownership[msg.sender].owned tmp t
      pop
      // stack: selector tag_5 sz elem ownership[msg.sender].owned tmp
      pop
      // stack: selector tag_5 sz elem ownership[msg.sender].owned
      swap3
      // stack: selector ownership[msg.sender].owned sz elem tag_5
      swap2
      // stack: selector ownership[msg.sender].owned tag_5 elem sz
      pop
      // stack: selector ownership[msg.sender].owned tag_5 elem
      pop
      // stack: selector ownership[msg.sender].owned tag_5
      jump	// out
    tag_9:
      0x00
      dup1
      0x00
      caller
      0xffffffffffffffffffffffffffffffffffffffff
      and
      0xffffffffffffffffffffffffffffffffffffffff
      and
      dup2
      mstore
      0x20
      add
      swap1
      dup2
      mstore
      0x20
      add
      0x00
      keccak256
      0x00
      add
      sload
      swap1
      pop
      swap1
      jump	// out
    tag_13:
      // stack: selector tag_5 sz elem 0 tmp tag_12
      mload(0x40)  // load the freeptr, which will be the address of a temporary 2-word block of unknown purpose, notated xxx
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx
      dup1
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx
      0x40
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx 0x40
      add
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx+0x40
      0x40
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx+0x40 0x40
      mstore  // allocate 0x40 bytes, new freeptr is freeptr+0x40
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx
      dup1
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx
      0x00
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx 0x00
      dup2
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx 0x00 xxx
      mstore  // initialize first newly allocated word to 0
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx
      0x20
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx 0x20
      add
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx+0x20
      0x00
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx+0x20 0
      dup2
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx+0x20 0 xxx+0x20
      mstore  // initialize second newly allocated word to 0
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx xxx+0x20
      pop
      // stack: selector tag_5 sz elem 0 tmp tag_12 xxx
      swap1
      // stack: selector tag_5 sz elem 0 tmp xxx tag_12
      jump	// out

    auxdata: 0xa2646970667358221220ee687099c688a3f01122a9684b3453038faf6d281a19e1a0fae899ba4b3be77564736f6c63430006020033
}
