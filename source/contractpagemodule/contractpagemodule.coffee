contractpagemodule = {name: "contractpagemodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["contractpagemodule"]?  then console.log "[contractpagemodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
#region localMOdules
utl = null
state = null
slideinModule = null

#endregion


############################################################
contractpagemodule.initialize = () ->
    log "contractpagemodule.initialize"
    utl = allModules.utilmodule
    state = allModules.statemodule
    slideinModule = allModules.slideinframemodule
    # contractpageContent.
    slideinModule.wireUp(contractpageContent, clearContent, applyContent)

    deployNewButton.addEventListener("click", deployNewButtonClicked)
    ##for debugging    
    # contractpagemodule.slideIn()
    return

############################################################
#region internalFunctions
deployNewButtonClicked = ->
    log "deployNewButtonClicked"
    clearContent()
    contractpagemodule.slideOut()
    allModules.deploycontractpagemodule.slideIn()
    return

############################################################
clearContent = ->
    log "clearContent"
    newAddressInput.value = "0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
    return

applyContent = ->
    log "applyContent"
    contractAddress = newAddressInput.value
    if contractAddress.slice(0,2) != "0x" then contractAddress = "0x"+contractAddress
    state.save("contractAddress", contractAddress)
    return

#endregion

############################################################
#region exposedFunctions
contractpagemodule.slideOut = ->
    log "contractpagemodule.slideOut"
    slideinModule.slideoutForContentElement(contractpageContent)
    return

contractpagemodule.slideIn = ->
    log "contractpagemodule.slideIn"
    slideinModule.slideinForContentElement(contractpageContent)
    return

#endregion

module.exports = contractpagemodule