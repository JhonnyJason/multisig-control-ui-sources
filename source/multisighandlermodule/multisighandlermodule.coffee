multisighandlermodule = {name: "multisighandlermodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["multisighandlermodule"]?  then console.log "[multisighandlermodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
ethers = require "../../../node_modules/ethers/dist/ethers.esm.min.js"
byteCodes = require("./multisigbytecodes")

############################################################
multisighandlermodule.initialize = () ->
    log "multisighandlermodule.initialize"
    return


module.exports = multisighandlermodule