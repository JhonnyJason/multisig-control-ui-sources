multisigbytecodes = {}

############################################################
multisigbytecodes.multiSig2of3 = "0x6060610f00610140396020610f0060c03960c05160a01c1561002057600080fd5b60206020610f000160c03960c05160a01c1561003b57600080fd5b60206040610f000160c03960c05160a01c1561005657600080fd5b6101c060006003818352015b60206101c0510261014001516101a05260006101a0511861008257600080fd5b600160006101a05160e05260c052604060c020555b8151600101808352811415610062575b505060006001557fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef600255610ee856600436101561000d57610e0b565b600035601c5263b2fa1c9e600051141561003b57341561002c57600080fd5b6001541560005260206000f350005b63b137fee960005114156100df57341561005457600080fd5b600c610140527f4d756c7469536967326f66330000000000000000000000000000000000000000610160526101408051602001806101e08284600060045af161009c57600080fd5b50506101e0518061020001818260206001820306601f820103905003368237505060206101c05260406101e0510160206001820306601f82010390506101c0f350005b63c0239fd360005114156103ff5734156100f857600080fd5b60043560a01c1561010857600080fd5b60006004351415151561015a576308c379a0610140526020610160526018610180527f43616e6e6f7420616464205a45524f5f414444524553532100000000000000006101a05261018050606461015cfd5b60015415156101a8576308c379a061014052602061016052601c610180527f576520616c7265616479206861766520616c6c2057616c6c65747321000000006101a05261018050606461015cfd5b600060043560e05260c052604060c02054156101ca57600160005260206000f3505b33610140526000601c6102a0527f19457468657265756d205369676e6564204d6573736167653a0a3936000000006102c0526102a0601c8060208461030001018260208501600060045af1505080518201915050600435602082610300010152602081019050600254602082610300010152602081019050610140516020826103000101526020810190508061030052610300905080516020820120905061016052610160516101a0526024356101c0526044356101e05260643561020052602060c060806101a060015afa5060c051610180526101805133141515156102f0576308c379a06101a05260206101c05260106101e0527f53656e646572206973205369676e657200000000000000000000000000000000610200526101e05060646101bcfd5b60003360e05260c052604060c02054151561034a576308c379a06101a05260206101c052600e6101e0527f496e76616c69642053656e646572000000000000000000000000000000000000610200526101e05060646101bcfd5b60006101805160e05260c052604060c0205415156103a7576308c379a06101a05260206101c05260116101e0527f496e76616c6964205369676e6174757265000000000000000000000000000000610200526101e05060646101bcfd5b6001600060043560e05260c052604060c020556002546004357f37f0f9467c7aca9eeccf6d31176b7bae3ab76bccb97617ba018feb6c9d4b3f7f60006000a3610160516002556000600155600160005260206000f350005b6354e4a20e60005114156106cf57341561041857600080fd5b60043560a01c1561042857600080fd5b600154151515610477576308c379a061014052602061016052600e610180527f57616c6c6574204d697373696e670000000000000000000000000000000000006101a05261018050606461015cfd5b600060043560e05260c052604060c02054151561049a57600160005260206000f3505b33610140526000601c6102a0527f19457468657265756d205369676e6564204d6573736167653a0a3936000000006102c0526102a0601c8060208461030001018260208501600060045af1505080518201915050600435602082610300010152602081019050600254602082610300010152602081019050610140516020826103000101526020810190508061030052610300905080516020820120905061016052610160516101a0526024356101c0526044356101e05260643561020052602060c060806101a060015afa5060c051610180526101805133141515156105c0576308c379a06101a05260206101c05260106101e0527f53656e646572206973205369676e657200000000000000000000000000000000610200526101e05060646101bcfd5b60003360e05260c052604060c02054151561061a576308c379a06101a05260206101c052600e6101e0527f496e76616c69642053656e646572000000000000000000000000000000000000610200526101e05060646101bcfd5b60006101805160e05260c052604060c020541515610677576308c379a06101a05260206101c05260116101e0527f496e76616c6964205369676e6174757265000000000000000000000000000000610200526101e05060646101bcfd5b6000600060043560e05260c052604060c0205560016001556002546004357fb6e8eff7bd4874fb228137f435045c0fcdebe439521091934ae6d08d53cd375160006000a361016051600255600160005260206000f350005b638f2cb2b260005114156109865734156106e857600080fd5b60043560a01c156106f857600080fd5b600154151515610747576308c379a061014052602061016052600e610180527f57616c6c6574204d697373696e670000000000000000000000000000000000006101a05261018050606461015cfd5b33610140526000601c6102a0527f19457468657265756d205369676e6564204d6573736167653a0a3936000000006102c0526102a0601c8060208461030001018260208501600060045af1505080518201915050602435602082610300010152602081019050600254602082610300010152602081019050610140516020826103000101526020810190508061030052610300905080516020820120905061016052610160516101a0526044356101c0526064356101e05260843561020052602060c060806101a060015afa5060c0516101805261018051331415151561086d576308c379a06101a05260206101c05260106101e0527f53656e646572206973205369676e657200000000000000000000000000000000610200526101e05060646101bcfd5b60003360e05260c052604060c0205415156108c7576308c379a06101a05260206101c052600e6101e0527f496e76616c69642053656e646572000000000000000000000000000000000000610200526101e05060646101bcfd5b60006101805160e05260c052604060c020541515610924576308c379a06101a05260206101c05260116101e0527f496e76616c6964205369676e6174757265000000000000000000000000000000610200526101e05060646101bcfd5b60006000600060006024356004356000f161093e57600080fd5b6024356101a0526002546004357fe80ab80f40b3053b2360e62637dccab967d106cb9bee6bc7262b10ce59e1add260206101a0a361016051600255600160005260206000f350005b6352feed036000511415610d7757341561099f57600080fd5b60043560a01c156109af57600080fd5b610120604435600401610140376101006044356004013511156109d157600080fd5b600154151515610a20576308c379a06102805260206102a052600e6102c0527f57616c6c6574204d697373696e670000000000000000000000000000000000006102e0526102c050606461029cfd5b33610280526004356102a0526024356102c05260006102a0516020826104800101526020810190506102c0516020826104800101526020810190506101406101008060208461048001018260208501600060045af1505080518201915050806104805261048090508051602082012090506102e0526000601c610440527f19457468657265756d205369676e6564204d6573736167653a0a39360000000061046052610440601c806020846104a001018260208501600060045af15050805182019150506102e0516020826104a00101526020810190506002546020826104a0010152602081019050610280516020826104a0010152602081019050806104a0526104a09050805160208201209050610300526103005161034052606435610360526084356103805260a4356103a052602060c0608061034060015afa5060c05161032052610320513314151515610bb7576308c379a0610340526020610360526010610380527f53656e646572206973205369676e6572000000000000000000000000000000006103a05261038050606461035cfd5b60003360e05260c052604060c020541515610c11576308c379a061034052602061036052600e610380527f496e76616c69642053656e6465720000000000000000000000000000000000006103a05261038050606461035cfd5b60006103205160e05260c052604060c020541515610c6e576308c379a0610340526020610360526011610380527f496e76616c6964205369676e61747572650000000000000000000000000000006103a05261038050606461035cfd5b6101408051602001806103a08284600060045af1610c8b57600080fd5b505060206105006103a0516103c06024356004355af1610caa57600080fd5b60203d80821115610cbb5780610cbd565b815b905090506104e0526104e08051602001806103408284600060045af1610ce257600080fd5b50506002546004357fdd4b9b318b98162cb1e7b52752a3fd110d5b7966f3b50884c1cd3bd04058e5c760006000a3610300516002556103408051602001806103e08284600060045af1610d3457600080fd5b50506103e0518061040001818260206001820306601f820103905003368237505060206103c05260406103e0510160206001820306601f82010390506103c0f350005b63fe9fbb806000511415610dbc573415610d9057600080fd5b60043560a01c15610da057600080fd5b600060043560e05260c052604060c0205460005260206000f350005b63fed39eed6000511415610de3573415610dd557600080fd5b60015460005260206000f350005b638cae80166000511415610e0a573415610dfc57600080fd5b60025460005260206000f350005b5b60006000f35b6100d7610ee8036100d76000396100d7610ee8036000f3"


module.exports = multisigbytecodes