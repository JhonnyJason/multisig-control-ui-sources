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
walletManager = null
ethersHandler = null

content = null

#endregion

############################################################
appcoremodule.initialize = () ->
    log "appcoremodule.initialize"
    state = allModules.statemodule
    walletManager = allModules.walletmanagementmodule
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
    walletManager.checkConnection()
    ## trigger check of our current contractAddress
    state.callOutChange("contractAddress")
    return

#endregion

export default appcoremodule