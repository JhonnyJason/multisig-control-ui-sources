
multisigabis = {}

############################################################
multisigabis.NoType = [
    {
      "name": "type",
      "outputs": [
        {
          "type": "string",
          "name": ""
        }
      ],
      "inputs": [],
      "stateMutability": "view",
      "type": "function",
      "gas": 4609,
      "constant": true
    },
    {
      "name": "isAuthorized",
      "outputs": [
        {
          "type": "bool",
          "name": ""
        }
      ],
      "inputs": [
        {
          "type": "address",
          "name": "arg0"
        }
      ],
      "stateMutability": "view",
      "type": "function",
      "gas": 1546,
      "constant": true
    },
    {
      "name": "isComplete",
      "outputs": [
        {
          "type": "bool",
          "name": ""
        }
      ],
      "inputs": [],
      "stateMutability": "view",
      "type": "function",
      "gas": 1154,
      "constant": true
    }
]

############################################################
multisigabis.MultiSig2of3 = [
    {
      "name": "EtherSent",
      "inputs": [
        {
          "type": "address",
          "name": "_to",
          "indexed": true
        },
        {
          "type": "uint256",
          "name": "_amount",
          "indexed": false
        },
        {
          "type": "bytes32",
          "name": "_ponce",
          "indexed": true
        }
      ],
      "anonymous": false,
      "type": "event"
    },
    {
      "name": "WalletAdded",
      "inputs": [
        {
          "type": "address",
          "name": "_wallet",
          "indexed": true
        },
        {
          "type": "bytes32",
          "name": "_ponce",
          "indexed": true
        }
      ],
      "anonymous": false,
      "type": "event"
    },
    {
      "name": "WalletRemoved",
      "inputs": [
        {
          "type": "address",
          "name": "_wallet",
          "indexed": true
        },
        {
          "type": "bytes32",
          "name": "_ponce",
          "indexed": true
        }
      ],
      "anonymous": false,
      "type": "event"
    },
    {
      "name": "TransactionExecuted",
      "inputs": [
        {
          "type": "address",
          "name": "_target",
          "indexed": true
        },
        {
          "type": "bytes32",
          "name": "_ponce",
          "indexed": true
        }
      ],
      "anonymous": false,
      "type": "event"
    },
    {
      "outputs": [],
      "inputs": [
        {
          "type": "address[3]",
          "name": "_isAuthorized"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "stateMutability": "payable",
      "type": "fallback",
      "payable": true
    },
    {
      "name": "isComplete",
      "outputs": [
        {
          "type": "bool",
          "name": ""
        }
      ],
      "inputs": [],
      "stateMutability": "view",
      "type": "function",
      "gas": 1154,
      "constant": true
    },
    {
      "name": "type",
      "outputs": [
        {
          "type": "string",
          "name": ""
        }
      ],
      "inputs": [],
      "stateMutability": "view",
      "type": "function",
      "gas": 4609,
      "constant": true
    },
    {
      "name": "addAuthorizedWallet",
      "outputs": [
        {
          "type": "bool",
          "name": ""
        }
      ],
      "inputs": [
        {
          "type": "address",
          "name": "_wallet"
        },
        {
          "type": "uint256",
          "name": "_v"
        },
        {
          "type": "uint256",
          "name": "_r"
        },
        {
          "type": "uint256",
          "name": "_s"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function",
      "gas": 99322
    },
    {
      "name": "removeAuthorizedWallet",
      "outputs": [
        {
          "type": "bool",
          "name": ""
        }
      ],
      "inputs": [
        {
          "type": "address",
          "name": "_wallet"
        },
        {
          "type": "uint256",
          "name": "_v"
        },
        {
          "type": "uint256",
          "name": "_r"
        },
        {
          "type": "uint256",
          "name": "_s"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function",
      "gas": 99244
    },
    {
      "name": "sendEther",
      "outputs": [
        {
          "type": "bool",
          "name": ""
        }
      ],
      "inputs": [
        {
          "type": "address",
          "name": "_to"
        },
        {
          "type": "uint256",
          "name": "_amount"
        },
        {
          "type": "uint256",
          "name": "_v"
        },
        {
          "type": "uint256",
          "name": "_r"
        },
        {
          "type": "uint256",
          "name": "_s"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function",
      "gas": 78532
    },
    {
      "name": "doTransaction",
      "outputs": [
        {
          "type": "bytes",
          "name": ""
        }
      ],
      "inputs": [
        {
          "type": "address",
          "name": "_target"
        },
        {
          "type": "uint256",
          "name": "_sent_value"
        },
        {
          "type": "bytes",
          "name": "_data"
        },
        {
          "type": "uint256",
          "name": "_v"
        },
        {
          "type": "uint256",
          "name": "_r"
        },
        {
          "type": "uint256",
          "name": "_s"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function",
      "gas": 85268
    },
    {
      "name": "isAuthorized",
      "outputs": [
        {
          "type": "bool",
          "name": ""
        }
      ],
      "inputs": [
        {
          "type": "address",
          "name": "arg0"
        }
      ],
      "stateMutability": "view",
      "type": "function",
      "gas": 1546,
      "constant": true
    },
    {
      "name": "incomplete",
      "outputs": [
        {
          "type": "bool",
          "name": ""
        }
      ],
      "inputs": [],
      "stateMutability": "view",
      "type": "function",
      "gas": 1361,
      "constant": true
    },
    {
      "name": "ponce",
      "outputs": [
        {
          "type": "bytes32",
          "name": ""
        }
      ],
      "inputs": [],
      "stateMutability": "view",
      "type": "function",
      "gas": 1391,
      "constant": true
    }
]

module.exports = multisigabis