#!/bin/sh
icon="$HOME/Pics/Icons/play-next-ico.png"

dbus-send \
--print-reply \
--dest=org.mpris.MediaPlayer2.spotify \
/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
