balancesectionmodule = {name: "balancesectionmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["balancesectionmodule"]?  then console.log "[balancesectionmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
balancesectionmodule.initialize = ->
    log "balancesectionmodule.initialize"
    return

############################################################
balancesectionmodule.checkBalances = ->
    log "balancesectionmodule.checkBalances"
    return

module.exports = balancesectionmodule