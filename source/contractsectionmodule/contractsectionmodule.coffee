contractsectionmodule = {name: "contractsectionmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["contractsectionmodule"]?  then console.log "[contractsectionmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
utl = null
state  = null

############################################################
addressContent = null

############################################################
contractsectionmodule.initialize = () ->
    log "contractsectionmodule.initialize"
    utl = allModules.utilmodule
    state = allModules.statemodule

    changeContractButton.addEventListener("click", allModules.changecontractpagemodule.slideIn)
    deployNewButton.addEventListener("click", allModules.deploycontractpagemodule.slideIn)

    addressContent = addressDisplay.getElementsByClassName("display-frame-content")[0]
    addressDisplay.addEventListener("click", addressDisplayClicked)

    syncDataFromState()
    state.addOnChangeListener("contractAddress", syncAddressFromState)
    state.addOnChangeListener("statusMessage", syncStatusFromState)
    state.addOnChangeListener("type", syncTypeFromState)
    return

############################################################
#region internalFunctions
syncDataFromState = ->
    syncTypeFromState()
    syncAddressFromState()
    return

############################################################
#region individualSyncFunctions
syncStatusFromState = ->
    log "syncStatusFromState"
    statusMessage = state.get("statusMessage")
    contractsectionmodule.displayStatusMessage(statusMessage)
    return

syncAddressFromState = ->
    log "syncAddressFromState"
    contractAddress = state.get("contractAddress")
    contractsectionmodule.displayContractAddress(contractAddress)
    return

syncTypeFromState = ->
    log "syncTypeFromState"
    type = state.get("type")
    contractsectionmodule.displayType(type)
    return

#endregion

############################################################
addressDisplayClicked = ->
    log "addressDisplayClicked"
    utl.copyToClipboard(addressContent.textContent)
    return
#endregion

############################################################
#region exposedFunctions
contractsectionmodule.displayContractAddress = (contractAddress) ->
    log "contractsectionmodule.displayContractAddress"
    addressContent.textContent = contractAddress
    return

contractsectionmodule.displayStatusMessage = (statusMessage) ->
    log "contractsectionmodule.displayStatusMessage"
    statusMessageDisplay.textContent = statusMessage
    return

contractsectionmodule.displayType = (type) ->
    log "contractsectionmodule.type"
    contractType.textContent = type
    return

#endregion

module.exports = contractsectionmodule