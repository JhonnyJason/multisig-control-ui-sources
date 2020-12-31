indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.deploycontractpageContent = document.getElementById("deploycontractpage-content")
    global.owner0Address = document.getElementById("owner0-address")
    global.owner1Address = document.getElementById("owner1-address")
    global.owner2Address = document.getElementById("owner2-address")
    global.deployButton = document.getElementById("deploy-button")
    global.contractpageContent = document.getElementById("contractpage-content")
    global.newAddressInput = document.getElementById("new-address-input")
    global.deployNewButton = document.getElementById("deploy-new-button")
    global.settingspageContent = document.getElementById("settingspage-content")
    global.idDisplay = document.getElementById("id-display")
    global.secretManagerInput = document.getElementById("secret-manager-input")
    global.dataManagerInput = document.getElementById("data-manager-input")
    global.content = document.getElementById("content")
    global.addressDisplay = document.getElementById("address-display")
    global.statusMessageDisplay = document.getElementById("status-message-display")
    global.changeContractButton = document.getElementById("change-contract-button")
    global.clickCatcher = document.getElementById("click-catcher")
    global.popup = document.getElementById("popup")
    global.popupTitle = document.getElementById("popup-title")
    global.popupCloseButton = document.getElementById("popup-close-button")
    global.popupContent = document.getElementById("popup-content")
    global.connectWalletButton = document.getElementById("connect-wallet-button")
    global.headerRight = document.getElementById("header-right")
    return
    
module.exports = indexdomconnect