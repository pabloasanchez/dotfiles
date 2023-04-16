#!/bin/bash
echo "Scan the network"
echo "-------------------"
echo "Network address? e.g. 192.168.1.0"
read NET_ADDR

if [[ $NET_ADDR == "" ]]
then NET_ADDR="192.168.1.0"
fi

echo "-------------------"
echo Address: $NET_ADDR 
nmap -sP $NET_ADDR/24
