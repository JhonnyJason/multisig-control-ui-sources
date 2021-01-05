indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.deploycontractpageContent = document.getElementById("deploycontractpage-content")
    global.newOwner0Address = document.getElementById("new-owner0-address")
    global.newOwner1Address = document.getElementById("new-owner1-address")
    global.newOwner2Address = document.getElementById("new-owner2-address")
    global.changecontractpageContent = document.getElementById("changecontractpage-content")
    global.newAddressInput = document.getElementById("new-address-input")
    global.settingspageContent = document.getElementById("settingspage-content")
    global.idDisplay = document.getElementById("id-display")
    global.secretManagerInput = document.getElementById("secret-manager-input")
    global.dataManagerInput = document.getElementById("data-manager-input")
    global.content = document.getElementById("content")
    global.contractType = document.getElementById("contract-type")
    global.addressDisplay = document.getElementById("address-display")
    global.statusMessageDisplay = document.getElementById("status-message-display")
    global.changeContractButton = document.getElementById("change-contract-button")
    global.deployNewButton = document.getElementById("deploy-new-button")
    global.clickCatcher = document.getElementById("click-catcher")
    global.popup = document.getElementById("popup")
    global.popupTitle = document.getElementById("popup-title")
    global.popupCloseButton = document.getElementById("popup-close-button")
    global.popupContent = document.getElementById("popup-content")
    global.connectWalletButton = document.getElementById("connect-wallet-button")
    global.headerRight = document.getElementById("header-right")
    return
    
module.exports = indexdomconnect