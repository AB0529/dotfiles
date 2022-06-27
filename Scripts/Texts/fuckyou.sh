#!/bin/bash 

for i in {1..9..2} 
do
    echo $i
    awk -vi=$i 'FNR == i {print}' $HOME/Scripts/Texts/fuckyou.txt | xclip -sel clip
    read -p "Press key to continue.. " -n1 -s
done
