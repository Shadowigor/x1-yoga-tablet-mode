# x1-yoga-tablet-mode

These are some scripts that should help the users of a Lenovo X1 Yoga to use their touchscreens in a more productive way. There are currently 4 scripts available:

 * _toggle-tablet-mode.sh:_
    Disables the touchpad to prevent mouse movement while in tablet mode. Does not disable the keyboard (yet).
 * _toggle-rotation-180.sh:_
    Rotates the screen 180° (upside down). Might be useful for some tablet usages.
 * _toggle-rotation-90.sh:_
    Rotates the screen 90°. For a more book-like aspect-ratio.
 * _toggle-virtual-keyboard.sh:_
    Shows/hides the virtual keyboard. 'florence' must be installed. Only works in tablet mode.

All those scripts are optimized and tested for a Lenovo X1 Yoga, but they should work on other devices too. Some adjustments would probably be necessary, though.

The script for the virtual keyboard might not be suited for you if you have a desktop environment that properly supports virtual keyboards. If you are using a window manager like i3 though, you might like it.

Tip: Binding the _toggle-virtual-keyboard.sh_ script to the 'Super' button is quite useful, because that is also the soft-button below the screen. This way you can also show/hide the virtual keyboard while the X1 is folded. You also don't have to worry about toggling the keyboard while in normal mode, because the script only works when you are in tablet mode.
