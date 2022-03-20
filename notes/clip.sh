#!/bin/bash

CAT_CMD="bat"
NOTES_DIR="/home/$(whoami)/notes"
NOTES_FILE="$NOTES_DIR/clippings"
NOTE=""

if [ $# == 0 ] ; then
  echo "Type or paste some text. Press CTRL+D to finish. Press CTRL+C to cancel."
  #read
  readarray -t INPUT
  for each in "${INPUT[@]}" 
  do
    NOTE+="$each"
    NOTE+="\n"
  done

else
  NOTE="$@"
fi

echo -e "\n*************************************************************************\n\n$NOTE" >> $NOTES_FILE

$CAT_CMD $NOTES_FILE
