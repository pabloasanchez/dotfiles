#!/bin/bash

CAT_CMD="bat"
NOTES_DIR="/home/$(whoami)/notes"
NOTES_FILE="$NOTES_DIR/todo"
NOTE=""

if [ $# == 0 ] ; then
  echo "Type a todo task. Press CTRL+D to finish."
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

echo -e "- $NOTE" >> $NOTES_FILE

$CAT_CMD $NOTES_FILE
