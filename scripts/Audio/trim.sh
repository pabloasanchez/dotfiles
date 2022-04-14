#!/bin/bash
# Example: sox source.mp3 final.mp3 trim 00:17:14 =00:24:56.2 fade 1 0 0
echo Usage: source_file out_file from_time to_time
echo Example: trim source.mp3 final.mp3 00:00:00 00:01:00.19
sox $1 $2 trim $3 $4 fade 1 0 1
