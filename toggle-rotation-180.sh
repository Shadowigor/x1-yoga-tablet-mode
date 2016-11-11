#!/bin/bash

# Check the current orientation
if xsetwacom --get 9 Rotate | grep half > /dev/null; then
    xrandr -o normal
    xsetwacom --set 9 Rotate none
    xsetwacom --set 10 Rotate none
    xsetwacom --set 16 Rotate none
    xinput enable 13  
    xinput enable 14
    rm -f "/tmp/florence-touch-active.lock"
else
    xrandr -o inverted
    xsetwacom --set 9 Rotate half
    xsetwacom --set 10 Rotate half
    xsetwacom --set 16 Rotate half
    xinput disable 13
    xinput disable 14
    touch "/tmp/florence-touch-active.lock"
fi

exit 0
