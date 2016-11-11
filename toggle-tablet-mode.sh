#!/bin/bash

# Check if we are already in tablet mode by checking if the devices are already disabled
if xinput list-props 13 | grep  "Device Enabled (138):"$'\t'"1" > /dev/null; then
    xinput disable 13
    xinput disable 14
    touch "/tmp/florence-touch-active.lock"
else
    xinput enable 13
    xinput enable 14
    rm -f "/tmp/florence-touch-active.lock"
fi

exit 0
