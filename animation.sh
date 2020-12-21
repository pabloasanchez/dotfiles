#!/bin/bash
DURATION=30
DIR=~/Pictures/

if [[ -d $1 ]]; then
  DIR=$1
fi

echo "Showing gif(s) from $DIR with args: $@"

if [[ $@ == *"--slideshow"* ]]
then
  LIST=$(ls $DIR*.gif | shuf | paste -sd ' ')
  chafa $LIST --duration=$DURATION --clear --stretch --speed 10fps --symbols ascii
else
  LIST=$(ls $DIR*.gif | shuf -n 1)
  chafa $LIST --clear --stretch --speed 10fps --symbols ascii
fi

if [[ $@ == *"--help"* ]]
then
  echo "Usage: "
  echo "./animation.sh [DIR] [--slideshow]"
  echo ""
  echo "No args provided will randomly display 1 .gif from DIR"
  echo "Default DIR is ~/Pictures."
  echo ""
  echo "  --help            Show this help information"
  echo "  --slideshow       Cycle *.gifs and display with Chafa"
fi

