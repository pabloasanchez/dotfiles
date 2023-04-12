#!/bin/bash
if [ -z $2 ]
then
  LANG=english
else
  LANG=$2
fi

if [ -s $1 ]
then
  cat $1 | iconv -f utf-8 -t iso-8859-1 | festival --tts --language $LANG
fi

