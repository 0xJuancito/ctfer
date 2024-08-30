// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract CTFTest6 is Test {
    uint256 pk;
    address user;
    string rpc;

    function setUp() public {
        pk = vm.envUint("PK");
        user = vm.envAddress("ADDR");
        rpc = vm.envString("RPC");

        vm.createSelectFork(rpc);

        console.log("BLOCK", block.number);
        console.log("TIME ", block.timestamp);
        console.log();
    }

    function testCTF6() public {
        vm.startPrank(user);

        Pranker pranker = new Pranker();
        pranker.prank();
    }
}

contract Pranker {
    constructor() {
        // 
    }

    function prank() external {
        // 
    }
}