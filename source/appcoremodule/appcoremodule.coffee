appcoremodule = {name: "appcoremodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["appcoremodule"]?  then console.log "[appcoremodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
#region modules
state = null
wallet = null
ethersHandler = null

content = null

#endregion

############################################################
appcoremodule.initialize = () ->
    log "appcoremodule.initialize"
    state = allModules.statemodule
    wallet = allModules.walletmanagementmodule
    ethersHandler = allModules.ethershandlermodule

    content = allModules.contentmodule
    return


############################################################
registerAllContracts = ->
    log "registerAllContracts"
    promises = (m.registerContracts() for n,m of allModules when m.registerContracts?) 
    await Promise.all(promises)
    return

############################################################
#region exposedFunction
appcoremodule.startUp = ->
    log "appcoremodule.startUp"
    await registerAllContracts()
    wallet.checkConnection()
    # multiSigContractAddr = "0x814548f1d03d58959dc9DBea4c1E2c125C42Ed11"
    # state.setSilently("contractAddress", multiSigContractAddr)
    state.callOutChange("contractAddress")
    
    return

#endregion

export default appcoremodule