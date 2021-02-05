#!/bin/sh

GPU=$(sensors | grep edge | awk '{ print ($2+0) }')
CPU=$(sensors | grep temp1  | awk '{ printf "%.0f\n", ($2+0) }')

echo 🌡 $CPU°/$GPU°
