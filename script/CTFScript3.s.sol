// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

contract CTFScript is Script {
    uint256 pk;
    address user;
    string rpc;

    function setUp() public {
        pk = vm.envUint("PK");
        user = vm.envAddress("ADDR");
        rpc = vm.envString("RPC");

        vm.createSelectFork(rpc);
    }

    function run() public {
        vm.startBroadcast(pk);

        // TODO
        // Pranker p = new Pranker();

        vm.stopBroadcast();
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

// forge script ./script/CTFScript3.s.sol --tc CTFScript --skip-simulation --broadcast

// --priority-gas-price