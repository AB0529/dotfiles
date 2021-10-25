#!/bin/bash

case "$1" in 
    gif)
        TMPFILE="$(mktemp -t screencast-XXXXXXX).mkv"
        OUTPUT=/tmp/out

        read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
        ffmpeg -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y "$TMPFILE"

        ffmpeg -y -i "$TMPFILE"  -vf fps=10,palettegen /tmp/palette.png
        notify-send -t 3000 -i $PICS/Icons/camera-ico.png 'Generating GIF...'
        ffmpeg -y -i "$TMPFILE" -i /tmp/palette.png -filter_complex "paletteuse" $OUTPUT.gif
        rm -f $TMPFILE

        # Optimize gif
        gifsicle -i $OUTPUT.gif -O3 --colors 256 -o $OUTPUT.gif

        dragon -x $OUTPUT.gif

        trap "rm -f '$TMPFILE'" 0
    ;;
    vid)
    ;;
esac
