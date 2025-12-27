//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewEngine{
    function des() public{
        selfdestruct(payable(address(0)));
    }
}