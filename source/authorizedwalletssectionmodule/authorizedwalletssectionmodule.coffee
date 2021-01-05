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

# ethersHandler
############################################################
owners = []

############################################################
authorizedwalletssectionmodule.initialize = () ->
    log "authorizedwalletssectionmodule.initialize"
    checkAllOwners()
    return
    
checkAllOwners = ->
    log "checkAllOwners"
    
    return

module.exports = authorizedwalletssectionmodule