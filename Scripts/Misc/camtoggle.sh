#!/bin/sh

pkill -f /dev/video || mpv --no-osc --no-input-default-bindings --input-conf=/dev/null --geometry=-0-0 --autofit=30% --title="Webcam" --profile=low-latency --untimed /dev/video0
