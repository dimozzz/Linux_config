#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


# exec openbox-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xmodmap -e 'clear lock' -e 'keycode 66=F13'
scim -d &
xsetroot -cursor_name left_ptr
xmobar ~/.xmobar/xmobarUp &
xmonad | xmobar ~/.xmobar/xmobarDown
