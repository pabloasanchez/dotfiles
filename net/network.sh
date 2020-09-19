#!/bin/bash
echo "Scan the network"
echo "-------------------"
echo "Network address? e.g. 192.168.1.0"
read NET_ADDR
echo "-------------------"
echo Address: $NET_ADDR 
nmap -sP $NET_ADDR/24
