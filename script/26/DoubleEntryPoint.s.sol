// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";
import {DoubleEntryPoint, Forta, IDetectionBot} from "../../src/26/DoubleEntryPoint.sol";


contract DoubleEntryPointScript is Script{

    DoubleEntryPoint doubleEntryPoint = DoubleEntryPoint(0x51DA05B74Ce580357C444F33f0cF6d64BCd81684);

    function run() public{
        Forta forta = doubleEntryPoint.forta();

        vm.startBroadcast();
        Bot bot = new Bot();
        forta.setDetectionBot(address(bot));

        vm.stopBroadcast();
    }
}


contract Bot is IDetectionBot{

    DoubleEntryPoint doubleEntryPoint = DoubleEntryPoint(0x51DA05B74Ce580357C444F33f0cF6d64BCd81684);
    Forta forta = doubleEntryPoint.forta();
    address cryptoVault = doubleEntryPoint.cryptoVault();
    address constant myAddrr = 0xF93eE28F72069752A808bbF56f9dB51952475AE0;

    function handleTransaction(address user, bytes calldata msgData) external override{
        require(msg.sender==address(forta));
        address vault;

        (, , vault) = abi.decode(msgData[4:], (address, uint256, address) );

        if(vault == cryptoVault){
            forta.raiseAlert(myAddrr);
        }

    }
}