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
state  = null

############################################################
addressContent = null

############################################################
contractsectionmodule.initialize = () ->
    log "contractsectionmodule.initialize"
    state = allModules.statemodule

    changeContractButton.addEventListener("click", allModules.contractpagemodule.slideIn)

    addressContent = addressDisplay.getElementsByClassName("display-frame-content")[0]
    addressDisplay.addEventListener("click", addressDisplayClicked)

    syncDataFromState()
    state.addOnChangeListener("contractAddress", syncDataFromState)
    state.addOnChangeListener("statusMessage", syncDataFromState)
    return

############################################################
#region internalFunctions
syncDataFromState = ->
    log "syncDataFromState"
    contractAddress = state.load("contractAddress")
    statusMessage = state.load("statusMessage")

    contractsectionmodule.displayContractAddress(contractAddress)
    contractsectionmodule.displayStatusMessage(statusMessage)
    return

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
#endregion

module.exports = contractsectionmodule