#!/bin/sh

FOLDERS="/home/nick/Pictures/achtergronden-4K-jxl/ /home/nick/Pictures/Azur_Lane /home/nick/Pictures/Safe?"

swaybg -o "DP-2" -i $(find $FOLDERS -type f | shuf -n1) -m fill -o "HDMI-A-2" -i $(find $FOLDERS -type f | shuf -n1) -m fill &
OLD_PID=$!
while true; do
    sleep 30
    swaybg -o "DP-2" -i $(find $FOLDERS -type f | shuf -n1) -m fill -o "HDMI-A-2" -i $(find $FOLDERS -type f | shuf -n1) -m fill &
    NEXT_PID=$!
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
