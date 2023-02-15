#!/bin/bash

sink=$(pactl info | grep -i "default sink" | cut -d ' ' -f3)
vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
inc=5

case "$1" in
    mute) pactl set-sink-mute $sink "toggle" ;;
    volup) pactl set-sink-volume $sink +$inc% ;;
    voldown) pactl set-sink-volume $sink -$inc% ;;
    volset)
        v=$(rofi -dmenu -p " Set Volume" -lines 0 -separator-style "none" -theme ~/.config/rofi/confirm.rasi &)
        wait
        echo $v
        [ $v -gt 100 ] && v=100
        [ $v -lt 0 ] && v=0
        pactl set-sink-volume $sink $v% ;;
esac

if [ "$sink" = "$SPEAKERS" ]; then
    echo "墳"
else
    # HEADPHONE_STATUS=$(headsetcontrol -bc)
    #
    # # Charging
    # [ $HEADPHONE_STATUS == -1 ] && echo " ()" && exit 0
    # # Off
    # [ $HEADPHONE_STATUS == -2 ] && echo "" && exit 0
    #
    # echo " ($HEADPHONE_STATUS%)"
    echo ""
fi
