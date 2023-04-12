#!/bin/bash

server=10.10.10.10      # server IP
port=22                 # port
connect_timeout=5       # Connection timeout

timeout $connect_timeout bash -c "</dev/tcp/$server/$port"
if [ $? == 0 ];then
   echo "SSH Connection to $server over port $port is possible"
else
   echo "SSH connection to $server over port $port is not possible"
fi
