#!/bin/zsh

mpd="$(mpc | grep -)"
mpdTime="$(mpc | grep '#' | sed -e 's/\(.*\)\(.* \) //')"
 
if [ -z "$mpd" ]; then
    echo ""
else
    echo $mpd $mpdTime 
fi