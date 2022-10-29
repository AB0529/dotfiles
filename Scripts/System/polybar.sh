#!/bin/bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
# for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # MONITOR=$m polybar --reload main -c "$HOME/.config/polybar/config.ini"&
# done

# Main bar
MONITOR=HDMI-A-0 polybar --reload main -c "~/.config/polybar/config.ini" &
# Secondary bar
MONITOR=DisplayPort-1 polybar --reload main -c "~/.config/polybar/secondary.ini" &

echo "Bar launched..."
