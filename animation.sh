#!/bin/bash 

DURATION=1000
DIR=~/Pictures/


#  Accepted classes for --symbols and --fill are [all, none, space, solid,
#  stipple, block, border, diagonal, dot, quad, half, hhalf, vhalf, inverted,
#  braille, technical, geometric, ascii, extra]. Some symbols belong to multiple
#  classes, e.g. diagonals are also borders. You can specify a list of classes
#  separated by commas, or prefix them with + and - to add or remove symbols
#  relative to the existing set. The ordering is significant.
#
#  The default symbol set is all-stipple-braille-ascii+space-extra-inverted for
#  all modes except "none", which uses all-stipple-braille-ascii+space-extra.


# SYMBOLS="all-ascii"
# FILL="space+solid+block+quad+half+hhalf+vhalf+braille+extra"
# CHAFA_ARGS="--clear --stretch --speed 10fps --symbols=$SYMBOLS --fill=$FILL --colors=2 --dither=diffusion --fg=ff0000"

SYMBOLS="ascii"
FILL="ascii"
CHAFA_ARGS="--clear --stretch --speed 10fps --symbols=$SYMBOLS --fill=$FILL"

if [[ -d $1 ]]; then
  DIR=$1
fi

echo "Showing gif(s) from $DIR with args: $@"

if [[ $@ == *"--slideshow"* ]]; then
  LIST=$(ls $DIR*.gif | shuf | paste -sd ' ')

  trap break SIGINT

  while true; do
    chafa $LIST $CHAFA_ARGS "--duration=$DURATION"
  done
else
  LIST=$(ls $DIR*.gif | shuf -n 1)
  chafa $LIST $CHAFA_ARGS
fi

if [[ $@ == *"--help"* ]]; then
  echo "Usage: "
  echo "./animation.sh [DIR] [--slideshow]"
  echo ""
  echo "No args provided will randomly display 1 .gif from DIR"
  echo "Default DIR is ~/Pictures."
  echo ""
  echo "  --help            Show this help information"
  echo "  --slideshow       Cycle *.gifs and display with Chafa"
fi

