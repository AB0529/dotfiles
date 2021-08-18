#!/bin/sh
icon="$HOME/Pics/Icons/speaker-ico.png"
speakers="alsa_output.pci-0000_08_00.3.analog-stereo"

for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
    pacmd move-sink-input $playing $speakers
done

pa_movesinks $speakers && notify-send -t 1000 -i $icon "Default Output" "Now using speakers"
