#!/bin/bash

LENGTH=1
DELAY=5

while true
do
    if [[ `cat /proc/asound/card*/pcm*/sub*/status | grep RUNNING | wc -l` -ne 0 ]]; then
        for ANGLE in 0 90 180 270
        do
            xdotool mousemove_relative --polar $ANGLE $LENGTH
            sleep $DELAY
        done
    fi
done
