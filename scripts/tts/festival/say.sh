#!/bin/bash
echo "$1" | iconv -f utf-8 -t iso-8859-1 | festival --tts
