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

currentContract = null

############################################################
multisighandlermodule.initialize = ->
    log "multisighandlermodule.initialize"
    contractManager = allModules.contractmanagermodule
    ethersHandler = allModules.ethershandlermodule
    state = allModules.statemodule

    state.addOnChangeListener("contractAddress", syncDataFromState)
    return

############################################################
syncDataFromState = ->
    log "syncDataFromState"
    contractAddress = state.get("contractAddress")
    account = state.get("account")
    
    # olog {contractAddress, account}
    # log account.length
    # log contractAddress.length
    return unless contractAddress? and contractAddress.length == 42
    return unless account? and account.length == 42

    chainId = ethersHandler.getChainId()
    n = "myMultiSig2of3"+contractAddress+chainId

    data = {}
    data.abi = abis.multiSig2of3
    data.addresses = {}
    data.addresses[chainId] = contractAddress
    
    # olog data

    await contractManager.addContract(n, data)

    try
        isComplete = await ethersHandler.contractCall(n, "isComplete")
        type = await ethersHandler.contractCall(n, "type")
        currentWalletIsOwner = await ethersHandler.contractCall(n, "isAuthorized", account)
        
        # olog {isComplete, type, currentWalletIsOwner}
        if !currentWalletIsOwner
            state.set("statusMessage", "! Current Wallet is not Authorized !")
        else if !isComplete
            state.set("statusMessage", "! An Authorized Wallet is missing !")
            
    catch err then log err

    return

############################################################
multisighandlermodule.deployMultiSig2of3 = (owners) ->
    log "multisighandlermodule.deployMultiSig2of3"
    
    abi = abis.multiSig2of3
    code = byteCodes.multiSig2of3

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