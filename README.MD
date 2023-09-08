# Configurable-Ready Ethereum network
As puppeth has been deprecated in geth 1.11, and yet ethash(POW) is deprecated in geth 1.12, it became harder and time consuming to build a small network to play with, and this repo is to solve this problem.

------

#### The main four scripts that you will work with are:

- `prepare.sh` contains the configurations, including password of keystores, nodes datadirs, and network configurations such chainId, period between each block
- `geth1.sh`, `geth2.sh`, and `geth3.sh` the nodes that will be holding the validators keys and produce blocks

# How to use 
start by preparing networks by executing `./prepare.sh`, run the `./bootnode` then execute the gethX scripts in any order.



------

if you have any issues feel free to open an issue. 

If you think you have some improvements, This repo is open for PRs.

