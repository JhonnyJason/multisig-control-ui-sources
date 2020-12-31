authorizedwalletssectionmodule = {name: "authorizedwalletssectionmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["authorizedwalletssectionmodule"]?  then console.log "[authorizedwalletssectionmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
authorizedwalletssectionmodule.initialize = () ->
    log "authorizedwalletssectionmodule.initialize"
    return
    
module.exports = authorizedwalletssectionmodule