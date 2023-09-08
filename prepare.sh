#!/usr/bin/bash

bootnode -genkey ".boot.key"
# set them as you like
chainId=1337
password="monate"
bootnode="enode://$(bootnode -writeaddress -nodekey .boot.key)@127.0.0.1:0?discport=30301"
node1_datadir="node1"
node2_datadir="node2"
node3_datadir="node3"
period=12 # seconds between blocks

# Warning: will remove old files, and data dirs!
rm -rf $node1_datadir $node2_datadir $node3_datadir
rm .keystore_pass .env

# create accounts
account1=$(echo -e "$password\n$password" | geth --datadir $node1_datadir account new | grep 'Public address' | cut -d ':' -f 2 | tr -d ' ')
account2=$(echo -e "$password\n$password" | geth --datadir $node2_datadir account new | grep 'Public address' | cut -d ':' -f 2 | tr -d ' ')
account3=$(echo -e "$password\n$password" | geth --datadir $node3_datadir account new | grep 'Public address' | cut -d ':' -f 2 | tr -d ' ')

# prepare genisis

cp .genisis_template.json genisis.json
cat genisis.json
sed -i "s/\"chainId\": [0-9]*/\"chainId\": $chainId/" genisis.json
sed -i "s/\"period\": [0-9]*/\"period\": $period/" genisis.json
sed -i "s/CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC/${account1#0x}/" genisis.json
sed -i "s/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB/${account2#0x}/" genisis.json
sed -i "s/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/${account3#0x}/" genisis.json

echo $password >.keystore_pass
echo "chainId=$chainId
password=$password
bootnode=$bootnode
node1_datadir=$node1_datadir
node2_datadir=$node2_datadir
node3_datadir=$node3_datadir
account1=$account1
account2=$account2
account3=$account3
" >.env

# prepare nodes

geth init --datadir $node1_datadir genisis.json
geth init --datadir $node2_datadir genisis.json
geth init --datadir $node3_datadir genisis.json

echo "===================="
echo "account1: $account1"
echo "account2: $account2"
echo "account3: $account3"
echo "===================="
echo "All three accounts are authorized validators"
