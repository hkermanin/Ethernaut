// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Stake} from "../../src/31/Stake.sol";

interface IWETH{
    function deposit() external payable;
    function approve(address guy, uint256 wad) external returns (bool);
}

contract StakeScript is Script{

    uint256 key1 = vm.envUint("KEY");
    uint256 key2 = vm.envUint("KEY2");

    Stake stake = Stake(0xC59d60d9cdc3D29090892C355CC43ff7B12f254c);
    IWETH wETH = IWETH(stake.WETH());

    function run() public{

        vm.startBroadcast(key2);
        wETH.approve(address(stake), 0.002 ether);
        stake.StakeETH{value:0.0015 ether}();
        stake.StakeWETH(0.0015 ether);
        vm.stopBroadcast();

        vm.startBroadcast(key1);
        stake.StakeETH{value:0.0015 ether}();
        stake.Unstake(0.0015 ether);
        vm.stopBroadcast();
       
    }

}