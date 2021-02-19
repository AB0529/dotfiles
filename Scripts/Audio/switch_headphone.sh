#!/bin/sh
icon="$HOME/Pics/Icons/headphone-ico.png"
headphones="alsa_output.pci-0000_08_00.3.analog-stereo"

for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
    pacmd move-sink-input $playing $headph
done

pa_movesinks $headphones && notify-send -t 1000 -i $icon "Default Output" "Now using headphones"
