// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";

import {NewEngine} from "../../src/25/NewEngine.sol";

interface ILogic{
    function upgrader() external view returns(address);
    function initialize() external;
    function upgradeToAndCall(address, bytes memory) external payable; 
}

contract MotorbikeScript is Script{
    function run() public{
        address ins = 0xD186b874926C59D94299CC447a0a3E5c0Cb3c55d;
        bytes32 slotAddrr = bytes32(uint256(keccak256("eip1967.proxy.implementation")) - 1);
        address logicAddrr = address(uint160(uint256(vm.load(ins, slotAddrr))));
        ILogic logic = ILogic(logicAddrr);

        vm.startBroadcast();

        NewEngine newEngine = new NewEngine();

        logic.initialize();

        bytes memory data = abi.encodeWithSignature("des()"); 

        logic.upgradeToAndCall(address(newEngine), data);

        vm.stopBroadcast();

    }
}