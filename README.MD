# Configurable-Ready Ethereum network
As puppeth has been deprecated in geth 1.11, and yet ethash(POW) is deprecated in geth 1.12, it became harder and time consuming to build a small network to play with, and this repo is to solve this problem.

------

###### The main three scripts that will work with are:

- `prepare.sh` contains the configurations, including password of keystores, nodes datadirs, and network configurations such chainId, period between each block
- `geth1.sh` the first nodes that will be holding the validator wallet and producing blocks
- `geth2.sh` the second note that only receive blocks to be a public accessible json-rpc, not required to run `geth1.sh` does that too by default



# How to use 

- change any configs you want in `prepare.sh`
- run the first node by executing `geth1.sh`
- optional, run the second node by executing `geth2.sh` 



------

This is not a puppeth alternative and not doesn't reproduce this great tool's functionality.

if you have any issues feel free to open an issue. 

If you think you have some improvements, This repo is open for PRs.

