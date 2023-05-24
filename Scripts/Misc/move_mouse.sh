#!/bin/bash

LENGTH=10
DELAY=3

while true
do
    if [[ $(cat /proc/asound/card*/pcm*/sub*/status | grep RUNNING | wc -l) -ne 0 ]]; then
        for ANGLE in 0 90 180 270
        do
            xdotool mousemove_relative --polar $ANGLE $LENGTH
            sleep $DELAY
        done
    fi
done

 # while :; do
 #     xdotool mousemove $(rand -M 800) $(rand -M 600);
 #     sleep 3
 # done
