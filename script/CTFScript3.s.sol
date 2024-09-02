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

        Lock lock = Lock(0xa9b2D11c21834E195dA89BCc76c04AE24057e52E);
        lock.open(69);

        vm.stopBroadcast();
    }
}

interface Lock {
    function open(uint256) external;
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