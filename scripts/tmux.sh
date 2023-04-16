#!/bin/sh

cd ~

byobu new-session -d -s main-monitor

byobu-layout restore main
byobu rename-window -t main-monitor:0 'main'
byobu select-pane -t 0
byobu send-keys -t 0 "~/calendar.sh" Enter
byobu select-pane -t 1
byobu send-keys -t 1 "~/rss.sh" Enter
byobu select-pane -t 2
byobu send-keys -t 2 "htop" Enter
byobu select-pane -t 3
byobu send-keys -t 3 "~/fire.sh" Enter
byobu select-pane -t 4
byobu send-keys -t 4 "musikcube" Enter

# idle
byobu new-window -t main-monitor:1 -n 'idle'
byobu select-window -t main-monitor:1
byobu send-keys -t 0 "~/clock.sh" Enter

# map
byobu new-window -t main-monitor:2 -n 'map'
byobu select-window -t main-monitor:2
byobu send-keys -t 0 "~/map.sh" Enter

#byobu select-window -t main-monitor:0
byobu attach -t main-monitor

#Finally, to be able to actually see anything, you need to launch a terminal for each session
#gnome-terminal --full-screen -- byobu attach -t LeftMonitor
#gnome-terminal --full-screen -- byobu attach -t RightMonitor
