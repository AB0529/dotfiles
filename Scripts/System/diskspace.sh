#!/bin/bash
used=$(df -h /dev/sda3 | awk 'FNR == 2 { print $3 }')
avail=$(df -h /dev/sda3 | awk 'FNR == 2 { print $4 }')

echo  $used / $avail
