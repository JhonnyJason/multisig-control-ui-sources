multisighandlermodule = {name: "multisighandlermodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["multisighandlermodule"]?  then console.log "[multisighandlermodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
#region modulesFromEnvironment
byteCodes = require "./multisigbytecodes"
abis = require "./multisigabis"

############################################################
authorizedWallets = null
contractManager = null
ethersHandler = null
balances = null
state = null

#endregion

############################################################
currentContract = null
knownContracts = null

############################################################
multisighandlermodule.initialize = ->
    log "multisighandlermodule.initialize"
    authorizedWallets = allModules.authorizedwalletssectionmodule
    contractManager = allModules.contractmanagermodule
    ethersHandler = allModules.ethershandlermodule
    balances = allModules.balancesectionmodule
    state = allModules.statemodule

    knownContracts = state.load("knownContracts")
    if !knownContracts? then knownContracts = {}
    state.save("knownContracts", knownContracts, true)

    state.addOnChangeListener("contractAddress", onContractChange)
    state.addOnChangeListener("account", onAccountChange)
    return

############################################################
#region internalFunctions
loadCurrentContract = ->
    log "loadCurrentContract"
    contractAddress = state.get("contractAddress")
    chainId = ethersHandler.getChainId()
    
    if !contractAddress? or contractAddress.length != 42
        currentContract = null
        return

    id = chainId + contractAddress
    currentContract = knownContracts[id]
    if currentContract? then return

    currentContract = null

    ## We did not know the contract before maybe it is a new valid contract
    type = await probeUnknownContract(chainId, contractAddress)
    if type != "NoType"
        await addNewContract(chainId, contractAddress, type, [])
        currentContract = knownContracts[id]
        olog {currentContract}
    return

addNewContract = (chainId, address, type, owners) ->
    log "addNewContract"
    return unless chainId and address
    if owners.length == 0 then owners = getFakeOwnersForType(type)

    id = chainId + address
    contract = {}
    contract.chainId = chainId
    contract.address = address
    contract.type = type
    contract.owners = owners
    knownContracts[id] = contract
    # olog {knownContracts}
    # olog {contract}

    state.save("knownContracts")
    # log "I should've saved the knownContracts..."
    ## also add it for contract manager
    data = {}
    data.abi = abis[type]
    data.addresses = {}
    data.addresses[chainId] = address
    await contractManager.addContract(id, data)
    return

probeUnknownContract = (chainId, address) ->
    log "probeUnknownContract"
    data = {}
    data.abi = abis["NoType"]
    data.addresses = {}
    data.addresses[chainId] = address

    n = "Probe"+chainId+address
    await contractManager.addContract(n, data)

    try return await ethersHandler.contractCall(n, "type")
    catch err then return "NoType"
    return

getFakeOwnersForType = (type) ->
    switch type
        when "MultiSig2of3" then return getFakeOwners(3)
        else getFakeOwners(3)
    return

getFakeOwners = (number) ->
    return unless number > 0
    
    result = []
    result.push state.get("account")
    number--

    while number > 0
        result.push "0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
        number--
    return result

############################################################
addKnownContracts = ->
    log "addKnownContracts"
    promises = []

    for id,contract of knownContracts
        data = {}
        data.abi = abis[contract.type]
        data.addresses = {}
        data.addresses[contract.chainId] = contract.address
        promises.push contractManager.addContract(id, data)
    
    await Promise.all(promises)
    return

############################################################
onContractChange = ->
    log "onContractChange"
    contractAddress = state.get("contractAddress")

    if !contractAddress? or contractAddress.length != 42
        state.save("type", "Unknown Contract")
        state.set("statusMessage", "! Invalid Contract Address !")
        return

    await loadCurrentContract()    
    await checkCurrentContract()
    return

onAccountChange = ->
    log "onAccountChange"
    await checkCurrentContract()
    return

############################################################
checkCurrentContract = ->
    log "checkCurrentContract"
    account = state.get("account")
    
    olog {currentContract}

    if currentContract? 
        authorizedWallets.setOwners(currentContract.owners)
        balances.checkBalances()

    try
        state.save("type", currentContract.type)

        n = currentContract.chainId+currentContract.address    
        isComplete = await ethersHandler.contractCall(n, "isComplete")
        state.set("isComplete", isComplete)
        
        if account?
            currentWalletIsOwner = await ethersHandler.contractCall(n, "isAuthorized", account)
            state.set("currentWalletIsOwner", currentWalletIsOwner)
        else
            state.set("currentWalletIsOwner", false)

        # olog {account}
        # olog {isComplete, type, currentWalletIsOwner}
        
        setCorrectStatusMessage()    
    catch err
        log err
        state.save("type", "Unknown Contract")
        state.set("statusMessage", "")

    return

setCorrectStatusMessage = ->
    log "setCorrectStatusMessage"
    currentWalletIsOwner = state.get("currentWalletIsOwner")
    isComplete = state.get("isComplete")

    if !currentWalletIsOwner
        state.set("statusMessage", "! Current Wallet is not Authorized !")
    else if !isComplete
        state.set("statusMessage", "! An Authorized Wallet is missing !")
    else
        state.set("statusMessage", "")
    return
 
#endregion

############################################################
multisighandlermodule.registerContracts = ->
    log "multisighandlermodule.registerContracts"
    await addKnownContracts()
    return

multisighandlermodule.checkAddressAuthority = (address) ->
    n = currentContract.chainId+currentContract.address
    isAuthorized = await ethersHandler.contractCall(n, "isAuthorized", address)
    throw new Error(address+" was not authorized!") unless isAuthorized
    return

multisighandlermodule.deployMultiSig2of3 = (owners) ->
    log "multisighandlermodule.deployMultiSig2of3"
    type = "MultiSig2of3"

    abi = abis[type]
    code = byteCodes[type]
    contract = await ethersHandler.getNewDeployedContract(abi, code, owners)
    await contract.deployTransaction.wait()

    chainId = ethersHandler.getChainId()
    addr = contract.address.toLowerCase()
    await addNewContract(chainId, addr, type, owners)

    state.save("contractAddress", addr)
    return


module.exports = multisighandlermodule

#   "address": "0x8d9708f3f514206486d7e988533f770a16d074a7",
#   "address": "0xe179e1ba053be567b0f3f4a85e961fbc9a7b403e",
