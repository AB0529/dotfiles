#!/bin/bash

if [ -z "$(pgrep -x polybar)" ]; then
    # Main bar
    MONITOR=$PRIMARY_DISPLAY polybar --reload main -c "~/.config/polybar/config.ini" &
    # Secondary bar
    MONITOR=$SECONDARY_DISPLAY polybar --reload main -c "~/.config/polybar/secondary.ini" &
else
    polybar-msg cmd restart
fi
