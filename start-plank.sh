#!/bin/bash

trap '' SIGHUP SIGTERM

plank > /dev/null 2>&1 &

get_resolutions() {
    xrandr | grep ' connected' | awk '{print $1,$3}' | sed 's/+.*//'
}

prev_res=$(get_resolutions)

while true; do
    xrandr --verbose > /tmp/xrandr_tmp 2>/dev/null
    
    curr_res=$(get_resolutions)
    
    if [ "$curr_res" != "$prev_res" ]; then
        pkill plank
        
        while pgrep plank > /dev/null; do
            sleep 0.1
        done
        
        plank > /dev/null 2>&1 &
        
        prev_res="$curr_res"
    fi
done
