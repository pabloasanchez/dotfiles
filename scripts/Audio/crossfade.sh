#!/bin/bash
echo Usage: part1_file part2_file out_file
sox $1 $2 $3 splice (soxi -D $1),0.5


