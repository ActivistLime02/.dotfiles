#!/bin/sh

FOLDERS="/home/nick/Pictures/achtergronden-4K-jxl/ /home/nick/Pictures/Azur_Lane /home/nick/Pictures/Safe?"

swaybg -o "LG Electronics LG TV SSCR2 0x00000101" -i $(find $FOLDERS -type f | shuf -n1) -m fill \
    -o "Acer Technologies R271 T60EE0032410" -i $(find $FOLDERS -type f | shuf -n1) -m fill \
    -o "Najing CEC Panda FPD Technology CO. ltd 0x0036 Unknown" -i $(find $FOLDERS -type f | shuf -n1) -m fill \
    &
OLD_PID=$!
while true; do
    sleep 30
    swaybg -o "LG Electronics LG TV SSCR2 0x00000101" -i $(find $FOLDERS -type f | shuf -n1) -m fill \
        -o "Acer Technologies R271 T60EE0032410" -i $(find $FOLDERS -type f | shuf -n1) -m fill \
        -o "Najing CEC Panda FPD Technology CO. ltd 0x0036 Unknown" -i $(find $FOLDERS -type f | shuf -n1) -m fill \
        &
    NEXT_PID=$!
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
