debugmodule = {name: "debugmodule", uimodule: false}

#####################################################
debugmodule.initialize = () ->
    # console.log "debugmodule.initialize - nothing to do"
    return

debugmodule.modulesToDebug = 
    unbreaker: true
    configmodule: true
    # contractpagemodule:true
    deploycontractpagemodule: true
    multisighandlermodule: true
    statemodule: true

export default debugmodule
