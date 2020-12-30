
genericABIs = {}

############################################################
genericABIs.erc20 = [
    {
        "constant": true,
        "inputs": [],
        "name": "name",
        "outputs": [
            {
                "name": "",
                "type": "string"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "name": "_spender",
                "type": "address"
            },
            {
                "name": "_value",
                "type": "uint256"
            }
        ],
        "name": "approve",
        "outputs": [
            {
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "totalSupply",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "name": "_from",
                "type": "address"
            },
            {
                "name": "_to",
                "type": "address"
            },
            {
                "name": "_value",
                "type": "uint256"
            }
        ],
        "name": "transferFrom",
        "outputs": [
            {
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "decimals",
        "outputs": [
            {
                "name": "",
                "type": "uint8"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "_owner",
                "type": "address"
            }
        ],
        "name": "balanceOf",
        "outputs": [
            {
                "name": "balance",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "symbol",
        "outputs": [
            {
                "name": "",
                "type": "string"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "name": "_to",
                "type": "address"
            },
            {
                "name": "_value",
                "type": "uint256"
            }
        ],
        "name": "transfer",
        "outputs": [
            {
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "_owner",
                "type": "address"
            },
            {
                "name": "_spender",
                "type": "address"
            }
        ],
        "name": "allowance",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "payable": true,
        "stateMutability": "payable",
        "type": "fallback"
    },
    {
        "anonymous": false,
        "inputs": [
            {
                "indexed": true,
                "name": "owner",
                "type": "address"
            },
            {
                "indexed": true,
                "name": "spender",
                "type": "address"
            },
            {
                "indexed": false,
                "name": "value",
                "type": "uint256"
            }
        ],
        "name": "Approval",
        "type": "event"
    },
    {
        "anonymous": false,
        "inputs": [
            {
                "indexed": true,
                "name": "from",
                "type": "address"
            },
            {
                "indexed": true,
                "name": "to",
                "type": "address"
            },
            {
                "indexed": false,
                "name": "value",
                "type": "uint256"
            }
        ],
        "name": "Transfer",
        "type": "event"
    }
]

############################################################
genericABIs.multiSig2of3 = [
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
        "gas": 99292
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
        "gas": 99214
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
        "gas": 78502
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
        "gas": 85238
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
        "gas": 1516,
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
        "gas": 1331,
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
        "gas": 1361,
        "constant": true
    }
]


module.exports = genericABIs