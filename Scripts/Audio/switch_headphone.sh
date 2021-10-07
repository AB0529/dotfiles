#!/bin/sh
icon="$HOME/Pics/Icons/headphone-ico.png"
headphones="alsa_output.usb-Razer_Razer_Nari_Essential-00.iec958-stereo"

for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
    pacmd move-sink-input $playing $headph
done

$HOME/Scripts/System/polybar.sh && pa_movesinks $headphones && notify-send -t 1000 -i $icon "Default Output" "Now using headphones"
