pragma solidity 0.8.21;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import { CrossChainIncrementor } from "../contracts/CrossChainIncrementor.sol";
import { IDeBridgeGateExtended } from "../contracts/debridge-protocol-evm-interfaces/interfaces/IDeBridgeGateExtended.sol";


contract CrossChainTest is Test {

    CrossChainIncrementor public incrementor;
    address public deBridgeGate = address(0x43dE2d77BF8027e25dBD179B491e8d64f38398aA); //mainnet address
    address public owner = address(0x749f88e87EaEb030E478164cFd3681E27d0bcB42);

    function setUp() public {
        uint mainnetFork = vm.createFork(vm.envString("MAINNET_RPC_URL"));
        vm.selectFork(mainnetFork);
        vm.startPrank(owner);
        incrementor = new CrossChainIncrementor();
        incrementor.setDeBridgeGate(IDeBridgeGateExtended(deBridgeGate));
    }

    function test_crossChain_message() external {

    }
}