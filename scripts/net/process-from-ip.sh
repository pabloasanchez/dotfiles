#!/bin/bash
echo "Search open file by IP"
echo "-------------------"
echo "Protocol? e.g., TCP/UDP"
read PROTO
echo "Port? e.g., 443"
read PORT
echo "-------------------"
sudo lsof -i $PROTO:$PORT
