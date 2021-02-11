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
ethersHandler = null
multiSig  = null
state = null

############################################################
owners = null
addressInputs = {}

############################################################ 
authorizedwalletssectionmodule.initialize = ->
    log "authorizedwalletssectionmodule.initialize"
    ethersHandler = allModules.ethershandlermodule
    multiSig = allModules.multisighandlermodule
    state = allModules.statemodule

    owner0Address.addEventListener("change", addressInputChanged)
    owner1Address.addEventListener("change", addressInputChanged)
    owner2Address.addEventListener("change", addressInputChanged)
    owner3Address.addEventListener("change", addressInputChanged)
    owner4Address.addEventListener("change", addressInputChanged)
    owner5Address.addEventListener("change", addressInputChanged)
    owner6Address.addEventListener("change", addressInputChanged)
    owner7Address.addEventListener("change", addressInputChanged)
    owner8Address.addEventListener("change", addressInputChanged)
    owner9Address.addEventListener("change", addressInputChanged)
    owner10Address.addEventListener("change", addressInputChanged)
    owner11Address.addEventListener("change", addressInputChanged)
    buildAddressInputsMap()
    return

############################################################ 
#region internalFunctions

buildAddressInputsMap = ->
    addressInputs.owner0Address = owner0Address 
    addressInputs.owner1Address = owner1Address 
    addressInputs.owner2Address = owner2Address 
    addressInputs.owner3Address = owner3Address 
    addressInputs.owner4Address = owner4Address 
    addressInputs.owner5Address = owner5Address 
    addressInputs.owner6Address = owner6Address 
    addressInputs.owner7Address = owner7Address 
    addressInputs.owner8Address = owner8Address 
    addressInputs.owner9Address = owner9Address 
    addressInputs.owner10Address = owner10Address 
    addressInputs.owner11Address = owner11Address 
    return
    
############################################################
addressInputChanged = (evt) ->
    log "addressInputChanged"
    el = evt.target
    index = inputIdToIndex(el.id)
    address = el.value.toLowerCase()

    owners[index] = address
    state.save("knownContracts")
    checkOwnerAuthority(index)
    return

############################################################
checkAllOwners = ->
    log "checkAllOwners"
    checkOwnerAuthority(i) for owner,i in owners
    return

checkOwnerAuthority = (index) ->
    log "checkOwnerAuthority"
    address = owners[index]
    log address
    el = getInputByIndex(index)

    try
        await multiSig.checkAddressAuthority(address)
        el.classList.add("authorized")
    catch err
        log err
        el.classList.remove("authorized")
    return

############################################################
inputIdToIndex = (id) -> parseInt(id.split("-")[0].replace("owner", ""))
getInputByIndex = (i) -> addressInputs["owner"+i+"Address"]

#endregion

############################################################
authorizedwalletssectionmodule.setOwners = (newOwners) ->
    log "authorizedwalletssectionmodule.setOwners"
    input.classList.remove("shown") for id,input of addressInputs
    
    olog newOwners
    owners = newOwners
    
    for owner,i in newOwners
        el = getInputByIndex(i)
        el.value = owner
        el.classList.add("shown")

    checkAllOwners()
    return

module.exports = authorizedwalletssectionmodule