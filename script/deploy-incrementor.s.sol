pragma solidity 0.8.21;

import { console, Script } from "../modules/forge-std/src/Script.sol";
import { Test } from "forge-std/Test.sol";

import { CrossChainIncrementor } from "../contracts/CrossChainIncrementor.sol";
import { IDeBridgeGateExtended } from "../contracts/debridge-protocol-evm-interfaces/interfaces/IDeBridgeGateExtended.sol";

contract DeployIncrementor is Script, Test {

    CrossChainIncrementor public incrementor;
    address public deBridgeGate = address(0x43dE2d77BF8027e25dBD179B491e8d64f38398aA); //avalanche address

    function run() external {
        uint256 pKey = vm.envUint("DEV_PRIVATE_KEY");
        vm.startBroadcast(pKey);

        // incrementor = new CrossChainIncrementor();
        // incrementor.setDeBridgeGate(IDeBridgeGateExtended(deBridgeGate));

        // console.log("Incrementor Address----------", address(incrementor));

        // assertEq(address(incrementor.deBridgeGate()), deBridgeGate);
        incrementor = CrossChainIncrementor(0xcAed8046d2e2b9E395f9b6f2d0206C77E380eBD4);
        // incrementor.addCounter(56, 0xcAed8046d2e2b9E395f9b6f2d0206C77E380eBD4);
        uint256 protocolFee = IDeBridgeGateExtended(deBridgeGate).globalFixedNativeFee();
        incrementor.incrementWithIncludedGas{value: protocolFee + 4e17}(3, 4e17);

    }
}