pragma solidity 0.8.21;

import { console, Script } from "../modules/forge-std/src/Script.sol";
import { Test } from "forge-std/Test.sol";

import { CrossChainCounter } from "../contracts/CrossChainCounter.sol";
import { IDeBridgeGateExtended } from "../contracts/debridge-protocol-evm-interfaces/interfaces/IDeBridgeGateExtended.sol";

contract DeployCounter is Script, Test {

    CrossChainCounter public counter;
    address public incrementor = address(0xcAed8046d2e2b9E395f9b6f2d0206C77E380eBD4);
    address public deBridgeGate = address(0x43dE2d77BF8027e25dBD179B491e8d64f38398aA); //bsc address

    function run() external {
        uint256 pKey = vm.envUint("DEV_PRIVATE_KEY");
        vm.startBroadcast(pKey);

        counter = new CrossChainCounter();
        counter.setDeBridgeGate(IDeBridgeGateExtended(deBridgeGate));

        console.log("counter Address----------", address(counter));

        assertEq(address(counter.deBridgeGate()), deBridgeGate);
        
        counter.addChainSupport(43114, abi.encodePacked(incrementor));

    }
}