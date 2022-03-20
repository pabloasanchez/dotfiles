#!/bin/bash
ARCHIVE_DIR=~/Backup/archivebox/
DB=~/Backup/archivebox/index.sqlite3

cd $ARCHIVE_DIR

if [[ $@ == *"--videos"* ]]; then
  echo "Filtering videos"
  FILTER="AND url LIKE '%youtube%'"
  VIDEO=1
fi

LINE=$(sqlite3 -separator ' ' index.sqlite3 "SELECT s.url, a.pwd FROM core_snapshot AS s, core_archiveresult AS a WHERE s.id = a.snapshot_id $FILTER ORDER BY RANDOM() LIMIT 1;")
URL=$(echo $LINE | awk '{ print $1 }')
DIR=$(echo $LINE | awk '{ print $2 }')
CONTENT="readability/content.html"

# clear

echo ""
echo ""
echo -e "Opening... \e[7m$URL\e[0m"
echo    "-------------------------------------------------"

if [[ $VIDEO == 1 ]]; then
  echo -e "\e[12mPlease wait, video is loading...\e[0m"
fi
echo -e "\e[2mArchive: $DIR/$CONTENT\e[0m"

sleep 2

# w3m "http://justread.mpgarate.com/read?url=$LINK"
# rdrview "$LINK" -B w3m
# w3m "$LINK"
~/Scripts/link-handler.sh "$URL"

echo ""

