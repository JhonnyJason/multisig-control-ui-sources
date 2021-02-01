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
contractManager = null
ethersHandler = null
state = null

#endregion

############################################################
currentContract = null
knownContracts = null

############################################################
multisighandlermodule.initialize = ->
    log "multisighandlermodule.initialize"
    contractManager = allModules.contractmanagermodule
    ethersHandler = allModules.ethershandlermodule
    state = allModules.statemodule

    knownContracts = state.load("knownContracts")
    if !knownContracts? then knownContracts = {}
    state.save("knownContracts", knownContracts, true)
    hasChanged = (v1,v2) -> JSON.stringify(v1) != JSON.stringify(v2)
    state.setChangeDetectionFunction("knownContracts", hasChanged)

    await addKnownContracts()
    await loadCurrentContract()

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
        await addNewContract(chainId, contractAddress, type)
        currentContract = knownContracts[id]
    return

addNewContract = (chainId, address, type) ->
    log "addNewContract"
    id = chainId + address
    contract = {}
    contract.chainId = chainId
    contract.address = address
    contract.type = type
    contract.owners = []
    knownContracts[id] = contract
    state.save("knownContracts", knownContracts)
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

############################################################
addKnownContracts = ->
    log "addKnownContracts"
    promises = []

    for contract,id of knownContracts
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
    return unless currentContract?
    
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
multisighandlermodule.deployMultiSig2of3 = (owners) ->
    log "multisighandlermodule.deployMultiSig2of3"
    
    abi = abis.MultiSig2of3
    code = byteCodes.MultiSig2of3

    contract = await ethersHandler.getNewDeployedContract(abi, code, owners)
    
    # name = "myMultiSig2of3"
    # data = {}
    # data.abi = abi
    # data.addresses = {}
    # data.addresses[ethersHandler.chainId] = contract.address
    
    # await contractManager.addContract(name, data)

    state.save("contractAddress", contract.address)
    return


module.exports = multisighandlermodule
