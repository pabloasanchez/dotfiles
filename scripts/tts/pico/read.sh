#!/bin/bash

OUTPUT=~/.read.wav

if [ -z $2 ]
then
  LANG=en-US
else
  LANG=$2
fi

if [ -n $1 ]
then
  pico2wave -l $LANG -w "$OUTPUT" "$(cat $1)" && mpv "$OUTPUT" && rm "$OUTPUT"
fi

