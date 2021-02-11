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
changecontractpagemodule.initialize = ->
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
    contractAddress = newAddressInput.value.toLowerCase()
    if contractAddress.slice(0,2) != "0x" then contractAddress = "0x"+contractAddress

    # before = state.get("contractAddress")
    
    # olog state.getState()

    # olog {before}
    # olog {contractAddress}
    # olog {areEqual: (before == contractAddress)}

    newAddressInput.value = "0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
    state.save("contractAddress", contractAddress)
    return

############################################################
displayKnownContracts = ->
    log "displayKnownContracts"
    knownContracts = state.get("knownContracts")
    chainId = allModules.ethershandlermodule.getChainId()
    html = ""
    for id,contract of knownContracts when contract.chainId == chainId
        html += getContractHTML(contract, id)
    if !html then html = "<p>No Known Contracts on this ChainId...</p>"
    knownContractsContainer.innerHTML = html

    elements = document.getElementsByClassName("known-contract")
    el.addEventListener("click", knownContractClicked) for el in elements
    return

getContractHTML = (contract, id) ->
    html = '<div class="known-contract"'
    html += ' contract-id="'+id+'">'
    html += contract.address+'</div>'
    return html

knownContractClicked = (evt) ->
    log "knownContractClicked"
    id = evt.target.getAttribute("contract-id")
    knownContracts = state.get("knownContracts")
    contract = knownContracts[id]
    state.save("contractAddress", contract.address)
    changecontractpagemodule.slideOut()
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
    displayKnownContracts()
    return

#endregion

module.exports = changecontractpagemodule