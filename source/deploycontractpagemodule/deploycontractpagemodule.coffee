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

#endregion


############################################################
deploycontractpagemodule.initialize = () ->
    log "deploycontractpagemodule.initialize"
    slideinModule = allModules.slideinframemodule
    # deploycontractpageContent.
    slideinModule.wireUp(deploycontractpageContent, clearContent, applyContent)

    ##for debugging    
    # deploycontractpagemodule.slideIn()

    return

############################################################
#region internalFunctions
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