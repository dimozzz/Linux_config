#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


xmodmap -e 'clear lock' -e 'keycode 66=F13'
scim -d &
udiskie &
xsetroot -cursor_name left_ptr
xmonad
