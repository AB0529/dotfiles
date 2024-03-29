#!/bin/sh
icon="$HOME/Pics/Icons/speaker-ico.png"

for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
    pacmd move-sink-input $playing $SPEAKERS
done

$SCRIPTS/Audio/pa_movesinks.sh $SPEAKERS && notify-send -t 1000 -i $icon "Default Output" "Now using speakers"

