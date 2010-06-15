#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


# exec openbox-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice


xmobar ~/.xmobar/xmobarUp &
xmonad | xmobar ~/.xmobar/xmobarDown
