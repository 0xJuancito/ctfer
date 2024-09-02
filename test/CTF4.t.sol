// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract CTFTest4 is Test {
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

    function testCTF4() public {
        vm.startPrank(user);

        Rand(0x67bc2abe147E7eac5B45d55491A7565673c02AE5).canYouUnlockMe(1, 1);
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

interface Rand {
    function canYouUnlockMe(uint256 _password, uint256 _seed) external;
}