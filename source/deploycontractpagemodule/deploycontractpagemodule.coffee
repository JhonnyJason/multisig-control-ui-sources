deploycontractpagemodule = {name: "deploycontractpagemodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["deploycontractpagemodule"]?  then console.log "[deploycontractpagemodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
#region localModules
slideinModule = null
multiSig = null
state = null

#endregion

############################################################
deploycontractpagemodule.initialize = () ->
    log "deploycontractpagemodule.initialize"
    slideinModule = allModules.slideinframemodule
    multiSig = allModules.multisighandlermodule
    state = allModules.statemodule
    
    # deploycontractpageContent.
    slideinModule.wireUp(deploycontractpageContent, clearContent, applyContent)

    ##for debugging    
    # deploycontractpagemodule.slideIn()
    # deployButton.addEventListener("click", deployButtonClicked)
    return

############################################################
#region internalFunctions
deployButtonClicked = ->
    log "deployButtonClicked"
    owners = []
    owners.push newOwner0Address.value
    owners.push newOwner1Address.value
    owners.push newOwner2Address.value
    # olog owners
    deploycontractpagemodule.slideIn()
    multiSig.deployMultiSig2of3(owners)
    clearContent()
    return

############################################################
setCurrentWalletAsOwner = ->
    account = state.get("account")
    if account? then newOwner0Address.value = account 
    return

############################################################
clearContent = ->
    log "clearContent"
    newOwner0Address.value = "0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
    newOwner1Address.value = "0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
    newOwner2Address.value = "0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
    return

applyContent = ->
    log "applyContent"
    deployButtonClicked()
    return

#endregion

############################################################
#region exposedFunctions

deploycontractpagemodule.slideOut = ->
    log "deploycontractpagemodule.slideOut"
    slideinModule.slideoutForContentElement(deploycontractpageContent)
    return

deploycontractpagemodule.slideIn = ->
    log "deploycontractpagemodule.slideIn"
    slideinModule.slideinForContentElement(deploycontractpageContent)
    setCurrentWalletAsOwner()
    return

#endregion

module.exports = deploycontractpagemodule