#!/bin/bash

# Only do something if we are in tablet-mode
if [ ! -e "/tmp/florence-touch-active.lock" ]; then
    exit 0
fi

# Check if the screen is rotated
if xsetwacom --get 9 Rotate | grep ccw > /dev/null; then
    width=1440
    y_show=1920
    y_hide=3000
    height=640
else
    width=2560
    y_show=720
    y_hide=3000
    height=720
fi

# If florence doesn't run yet, start it up
if [ $(ps aux | grep "/usr/local/bin/florence" | wc -l) -lt 2 ]; then
    /usr/local/bin/florence &
    rm "/tmp/florence-visible.lock"

    # Wait until the window is shown (http://stackoverflow.com/a/19441380)
    WINREP=""
    while [[ ! "`echo $WINREP | grep -l 'Map State: IsViewable'`" ]] ; do
        WINREP=$(xwininfo -name 'florence')
        sleep 0.1
    done
fi

# Make sure the window has the right dimensions for the current orientation
i3-msg '[class="^Florence$" instance="^florence$"] resize set '"$width $height"

# Decide whether the keyboard has to be shown or hidden
if [ -e "/tmp/florence-visible.lock" ]; then
    rm "/tmp/florence-visible.lock"
    y_current="$y_hide"
else
    touch "/tmp/florence-visible.lock"
    y_current="$y_show"
fi

# Show/hide the keyboard by moving it to a visible/invisible position
i3-msg '[class="^Florence$" instance="^florence$"] move absolute position 0 px '"$y_current px"

exit 0
