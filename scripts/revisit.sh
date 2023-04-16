#!/bin/bash

ARCHIVE_DIR=~/Backup/archivebox/archive
RDM_ARCHIVE=$(ls $ARCHIVE_DIR | shuf -n 1)

clear
echo -e "\e[7m$(cat $ARCHIVE_DIR/$RDM_ARCHIVE/index.json | jq '.title, .base_url')\e[0m"
echo -e "\e[35m$ARCHIVE_DIR/$RDM_ARCHIVE/readability/content.html\e[0m"

sleep 3
w3m $ARCHIVE_DIR/$RDM_ARCHIVE/readability/content.html
echo ""
