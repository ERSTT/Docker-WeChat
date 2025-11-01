#!/bin/bash

trap '' SIGHUP SIGTERM

plank > /dev/null 2>&1 &

prev_res=$(xrandr | grep '*' | awk '{print $1}')

# 无限循环，但不占用 CPU
while true; do
    xrandr --verbose | while read -r line; do
        curr_res=$(xrandr | grep '*' | awk '{print $1}')
        if [ "$curr_res" != "$prev_res" ]; then
            pkill plank
            sleep 0.5
            plank > /dev/null 2>&1 &
            prev_res=$curr_res
            break
        fi
    done
done
