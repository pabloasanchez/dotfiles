#!/bin/bash
echo "IP Address?"
read IP_ADDR
set +x
nmap $IP_ADDR
