# Ethernaut with Foundry

A collection of my Solidity practice from levels 22–32 of OpenZeppelin’s
Ethernaut. I used Foundry to organize the contracts and scripts by level.

## Covered levels

| Level | Challenge |
| --- | --- |
| 22 | Dex |
| 23 | Dex Two |
| 24 | Puzzle Wallet |
| 25 | Motorbike |
| 26 | DoubleEntryPoint |
| 27 | Good Samaritan |
| 28 | Gatekeeper Three |
| 29 | Switch |
| 30 | HigherOrder |
| 31 | Stake |
| 32 | Impersonator |

## Repository layout

- `src/` contains the Solidity contracts organized by level.
- `script/` contains the corresponding Foundry scripts.
- `broadcast/` contains records from previous script runs.

## Build locally

With Foundry installed:

```sh
git clone --recurse-submodules https://github.com/hkermanin/Ethernaut.git
cd Ethernaut
forge build
```
