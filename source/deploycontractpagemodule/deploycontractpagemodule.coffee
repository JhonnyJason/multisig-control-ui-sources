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
#region localMOdules
slideinModule = null
multiSig = null

#endregion


############################################################
deploycontractpagemodule.initialize = () ->
    log "deploycontractpagemodule.initialize"
    slideinModule = allModules.slideinframemodule
    multiSig = allModules.multisighandlermodule

    # deploycontractpageContent.
    slideinModule.wireUp(deploycontractpageContent, clearContent, applyContent)

    ##for debugging    
    # deploycontractpagemodule.slideIn()
    deployButton.addEventListener("click", deployButtonClicked)
    return

############################################################
#region internalFunctions
deployButtonClicked = ->
    log "deployButtonClicked"
    owners = []
    owners.push owner0Address.value
    owners.push owner1Address.value
    owners.push owner2Address.value
    olog owners
    await multiSig.deployMultiSig2of3(owners)
    log "all done!"
    return

############################################################
clearContent = ->
    log "clearContent"

    return

applyContent = ->
    log "applyContent"
    
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
    return

#endregion

module.exports = deploycontractpagemodule