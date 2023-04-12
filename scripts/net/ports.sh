#!/bin/bash
echo "IP Address?"
read IP_ADDR
set +x
nmap -sV $IP_ADDR
