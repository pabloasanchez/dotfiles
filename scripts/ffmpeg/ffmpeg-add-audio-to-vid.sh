#!/bin/bash

read -p "Video file? " V
read -p "Audio file? " A
read -p "Output video file? " O

ffmpeg -i $V -i $A -c:v copy -shortest $O
