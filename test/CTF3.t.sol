// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract CTFTest3 is Test {
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

    /// forge-config: default.fuzz.runs = 100000000
    function testCTF3(uint256 i) public {
        i = uint256(bound(uint256(i), 0, type(uint256).max));
        // vm.assume(i > 69);

        vm.startPrank(user);

        // Pranker pranker = new Pranker();
        // pranker.prank();

        Lock lock = Lock(0xa9b2D11c21834E195dA89BCc76c04AE24057e52E);

        // lock.open(69);

        // lock.brick();

            try lock.open(i) {
                // console.log(i);
                revert();
            } catch {
                // console.log(i);
            }

        // for (uint256 i = 0; i < 100; i++) {
        //     try lock.open(i) {
        //         console.log(i);
                
        //     } catch {
        //         // console.log(i);
        //     }
        // }
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

interface Lock {
    function open(uint256) external;
    function brick() external;
}