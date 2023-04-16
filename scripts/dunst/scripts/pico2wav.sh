#!/bin/bash

# you can specify a script that gets run when the rule matches by setting
# the 'script' option.
# The script will be called as follows:
# script appname summary body icon urgency
# where urgency can be "LOW", "NORMAL" or "CRITICAL".

summary="$2"
body="$3"  
# body=$(echo "$body" | sed 's/[\w \W \s]*http[s]*[a-zA-Z0-9 : \. \/ ; % " \W]*/ /g')
lang=$(lang-detect "$3")  # See scripts/lang/lang-detect

TTS="pico-say"  # See scripts/tts/pico/say.sh

if [ $lang = "es" ] ; then
  TTS_LANG="es-ES"
else
  TTS_LANG="en-US"
fi

eval "$TTS '$summary' $TTS_LANG" 
sleep 1
eval "$TTS '$body' $TTS_LANG" 

