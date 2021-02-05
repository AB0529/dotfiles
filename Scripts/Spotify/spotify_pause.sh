#!/bin/sh
icon="$HOME/Pics/Icons/play-pause-ico.png"

dbus-send \
--print-reply \
--dest=org.mpris.MediaPlayer2.spotify \
/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause && \
notify-send -i $icon -t 1500 "Spotify" "Paused/Resumed Playback"
