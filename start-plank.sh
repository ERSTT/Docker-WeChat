#!/bin/bash

trap '' SIGHUP SIGTERM

plank > /dev/null 2>&1 &

prev_res=$(xrandr | grep '*' | awk '{print $1}')

while true; do
    sleep 2
    curr_res=$(xrandr | grep '*' | awk '{print $1}')
    if [ "$curr_res" != "$prev_res" ]; then
        pkill plank
        sleep 1
        plank > /dev/null 2>&1 &
        prev_res=$curr_res
    fi
done
