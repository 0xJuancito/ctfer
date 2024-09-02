Addr: 0xcC87B6cC86edA38b6e7C41B08da6a52cb23b2fAF


```
Challenge 1

How is the weather in Madrid like today? How much is 1 ETH in DAI? What the hell is Megatherium? So many questions 🤯 
If only there was a way to get answers automatically... 🤔  Say no more, it's the Processor time!
Ignore the rumors saying that with some effort the contract can be *fully drained*.

Processor: 0x8ACF70DaA6541EA459cc3C1B89754C95B90ea7c4
RequestModule: 0xFF6d3eF5f55657A06C4105658311B75E3295bf91
CallbackModule: 0xb4F6A3a02815fA7E86a1254690031C38A397B228
```

```
Challenge 2

Banco Rio has finally opened a blockchain department and their first product is a staking contract with lucrative rewards. 🤑
The contract is simple and well documented, which significantly reduces the chances of *all deposits being stolen*.
What are you waiting, anon? Let's ape in! 🦍

Staking: 0xD6F79FFFDdb5b0dDd8F127976e1a836189FcbBB5
```

```
Challenge 3

It's safe to say that the beloved multisig codebase is a bit tricky to navigate.
They can also be tricky to manage...
It'd be a shame if someone would take control of one.

CustomSafe: 0x87DFd1577F61457e1e3bF122C1BB03245A42926F
```

```
Challenge 4

😌 They say patience is key but the keys to this challenge are being tightly held by the quickest hand.
10 minutes should be MORE THAN ENOUGH to solve this, just *transfer ALL the tokens out* in the shortest possible time. 
As you know the faster teams get more points! So make sure you read the code and start the timer ASAP!!! ⏲️

JustWait: 0xfF29F94c268Aec9FC63eaec0D2155EB3A3594161
```

```
Sepolia etherscan is bugged, here is the contract code or you can also check it with cast if you want:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IERC20} from '@openzeppelin/token/ERC20/IERC20.sol';

contract JustWait {
  address public token;
  uint256 public waitTime;
  uint256 public passcode;

  error InvalidPasscode();
  error Wait();
  error Deposit();

  constructor(address _token, uint256 _passcode) {
    token = _token;
    passcode = _passcode;
  }

  function deposit() external {
    IERC20(token).transferFrom(msg.sender, address(this), 1 ether);
    waitTime = block.timestamp + 10 minutes;
  }

  function claim(
    uint256 _passcode
  ) external {
    if (waitTime == 0) {
      revert Deposit();
    }

    // Wait for 10 minutes
    if (block.timestamp < waitTime) {
      revert Wait();
    }

    uint256 decodedPasscode = ((_passcode ^ 0xBBBB) >> 136) ^ 0xFFFF;

    if (passcode == decodedPasscode) {
      revert InvalidPasscode();
    }

    IERC20(token).transfer(msg.sender, IERC20(token).balanceOf(address(this)));
  }

  fallback() external {}
}
```

```
Challenge 5

Is the desire to open all possible locks universal or is it Mr Feynman's influence manifesting on me?  In this challenge, we'll find out who is capable of cracking a code.
Some people just want to see the world burn and we know for sure that this particular PK belongs to one of those looking to brick your contracts:
0xc31d4bc63453fe61d75360308fde803491f1813ce1eddb51c0311272703681ac
You will get NO POINTS if they succeed and 1 point for an unlocked contract.

Lock: 0xa9b2D11c21834E195dA89BCc76c04AE24057e52E
```

```
Challenge 6

This is extremely embarrassing, but I had committed myself to a shopaholics recovery program just before the new Plumbus 9000 was released. 😕
I'm desperate to get my hands on one! Alas, all my net worth is locked in a smart contract and being released at a snail's pace. 🐌
Could you please get all my tokens out of the contract?

SlowlyButSurely: 0x39Ff56383DAe3c0198Ab98c0Da093980e611d3C2
```

```
Challenge 7

Ah, ones and zeroes, to understand them, easy for a computer, hard for a human, which one are you?
Can you unlock me? The program asks... what a random thing to say...

PseudoGenerator: 0x9f0377375a0C3adD26f049870A4b52BB08BF7F7c
UnverifiedRandomness: 0x67bc2abe147E7eac5B45d55491A7565673c02AE5
```



EXTRAS

```
Extra 1

Oh no, all my ETH is gone after a Metamask support incident! But the Valuable Tokens are left inctact, can somebody please help me rescue them? I will give you 10% and 2 points for successfully *transferring all tokens to your wallet*.
Here is the private key: `0x90a11a3b73dee42d06f198c1e65b36ebd05bf7471a5c29b8336db4c7a85edda6`
```

```
Extra 2

Unfortunately, another incident has happened and my ETH is gone again :angry:
But at least the Valuable Tokens have not been stolen yet. *Return all of them* in exchange for 2 points while I'm looking for the latest edition of On-Chain Security for Dummies.
`0xc832fba658e9d82ec04240676edd5e161ce94ff300d4f4891675d43cb427f7ff`
```