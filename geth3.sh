#!/usr/bin/bash

source .env
etherbase="$account3"
datadir="$node3_datadir"

geth --datadir "$datadir" --syncmode full --networkid $chainId \
    --allow-insecure-unlock --unlock $etherbase --password .keystore_pass \
    --http --http.port 8550 --http.corsdomain '*' --authrpc.port 8889 --http.vhosts '*' \
     --port 30307 \
    --ipcdisable --nat extip:127.0.0.1 \
    --mine --miner.etherbase $etherbase --snapshot=false \
    --bootnodes "$bootnode" \
    --http.api personal,eth,net,web3,txpool,miner,rpc,admin,debug console

