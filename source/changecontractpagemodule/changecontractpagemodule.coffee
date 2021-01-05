changecontractpagemodule = {name: "changecontractpagemodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["changecontractpagemodule"]?  then console.log "[changecontractpagemodule]: " + arg
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
changecontractpagemodule.initialize = () ->
    log "changecontractpagemodule.initialize"
    utl = allModules.utilmodule
    state = allModules.statemodule
    slideinModule = allModules.slideinframemodule
    # changecontractpageContent.
    slideinModule.wireUp(changecontractpageContent, clearContent, applyContent)

    ##for debugging    
    # changecontractpagemodule.slideIn()
    return

############################################################
#region internalFunctions
clearContent = ->
    log "clearContent"
    newAddressInput.value = "0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
    return

applyContent = ->
    log "applyContent"
    contractAddress = newAddressInput.value
    if contractAddress.slice(0,2) != "0x" then contractAddress = "0x"+contractAddress

    # before = state.get("contractAddress")
    
    # olog state.getState()

    # olog {before}
    # olog {contractAddress}
    # olog {areEqual: (before == contractAddress)}

    state.save("contractAddress", contractAddress)
    return

#endregion

############################################################
#region exposedFunctions
changecontractpagemodule.slideOut = ->
    log "changecontractpagemodule.slideOut"
    slideinModule.slideoutForContentElement(changecontractpageContent)
    return

changecontractpagemodule.slideIn = ->
    log "changecontractpagemodule.slideIn"
    slideinModule.slideinForContentElement(changecontractpageContent)
    return

#endregion

module.exports = changecontractpagemodule