#!/bin/bash

ARCHIVE_DIR=/mnt/storage/Backup/archivebox/archive
RDM_ARCHIVE=$(ls $ARCHIVE_DIR | shuf -n 1)
CONTENT="$ARCHIVE_DIR/$RDM_ARCHIVE/readability/content.html"
MEDIA=$(find "$ARCHIVE_DIR/$RDM_ARCHIVE/media/" -name "*.mp4" && find "$ARCHIVE_DIR/$RDM_ARCHIVE/media/" -name "*.webm")

echo "$ARCHIVE_DIR/$RDM_ARCHIVE"

if test -f "$MEDIA"
then
  mpv "$MEDIA" --quiet --sub-font-size=12 &
fi

if test -f "$CONTENT"
then
  echo -e "\e[7m$(cat $ARCHIVE_DIR/$RDM_ARCHIVE/index.json | jq '.title, .base_url')\e[0m"
  w3m $ARCHIVE_DIR/$RDM_ARCHIVE/readability/content.html
else
  echo Not archived yet.
  ~/Scripts/revisit.sh
fi


