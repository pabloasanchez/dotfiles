#!/bin/bash
echo "Scan network ports"
echo "-------------------"
echo "Network address? e.g. 192.168.1.0"
read NET_ADDR
echo "Ports? e.g. 80,443"
read NET_PORTS
echo "-------------------"
echo Address: $NET_ADDR 
nmap -sT -p $NET_PORTS $NET_ADDR/24
