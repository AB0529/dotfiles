#!/bin/bash
source ~/Scripts/settings.sh

filename=`~/Scripts/gen_random_filename.sh`
filename=${filename,,}

case "$1" in
	link) 
		maim -s '/tmp/1.png' && \
		echo -n `curl -F name=$filename -F key=$api_key -F screenshot=@'/tmp/1.png' $api_url` | \
		xclip -selection clipboard && \
		notify-send -i ~/Pics/Icons/camera-ico.png "Screnshot" "Saved as $filename" && \
		rm -f /tmp/1.png
	;;
	img)
		maim -s | xclip -selection clipboard -t image/png && \
		notify-send -i ~/Pics/Icons/camera-ico.png "Screnshot" "Saved as $filename" && \
		rm -f /tmp/1.png || exit 1
	;;
esac
