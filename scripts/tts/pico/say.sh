#!/bin/bash

# say.sh "Hello world!" en-US
# say.sh "¡Hola mundo!" es-ES

OUTPUT=~/.say.wav

if [ -z "$2" ]
then
  LANG=en-US
else
  LANG=$2
fi

if [ -n "$1" ]
then
  pico2wave -l $LANG -w "$OUTPUT" "$1" &
  _pid=$! 
  sleep 1
  mpv "$OUTPUT" && sleep 1 && rm "$OUTPUT" && kill $_pid
fi

