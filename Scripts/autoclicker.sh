#!/bin/bash
mouse_id=9

while true; do

lclick=$(xinput --query-state $mouse_id | grep -o 'button\[9\]=down')
rclick=$(xinput --query-state $mouse_id | grep -o 'button\[8\]=down')

[ ! -z "$lclick" ] && xdotool click --delay 0 1 
[ ! -z "$rclick" ] && xdotool click --delay 0 3

done
