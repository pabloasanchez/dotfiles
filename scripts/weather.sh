#!/usr/bin/fish
curl --silent "wttr.in?format=3" > ~/tmp/weather.log && notify-send "Current weather" (cat ~/tmp/weather.log)
