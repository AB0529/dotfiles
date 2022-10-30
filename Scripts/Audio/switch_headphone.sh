#!/bin/sh
icon="$HOME/Pics/Icons/headphone-ico.png"

for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
    pacmd move-sink-input $playing $HEADPHONES
done

$SCRIPTS/Audio/pa_movesinks.sh $HEADPHONES && notify-send -t 1000 -i $icon "Default Output" "Now using headphones"
