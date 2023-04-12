#!/bin/bash

summary="$2"
body="$3"
lang=$(lang-detect "$3")  # See scripts/lang/lang-detect

echo "$summary" | espeak -v $lang+f5 -a 30
echo "$body" | sed 's/[\w \W \s]*http[s]*[a-zA-Z0-9 : \. \/ ; % " \W]*/ /g' | espeak -v $lang+f5 -a 30 -s 150
