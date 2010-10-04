#!/bin/zsh

case $TERM in
 linux|screen|screen.linux)
	if [ "${#@}" = "3" ]; then
		mplayer -vo fbdev -zoom -x "${2}" -y "${3}" "${1}"
	fi
	if [ "${#@}" = "2" ]; then
		mplayer -vo fbdev -sub "${2}" -zoom -x "1024" -y "568" "${1}"
	fi
	if [ "${#@}" = "1" ]; then
		mplayer -vo fbdev -zoom -x "1024" -y "568" "${1}"
	fi
 ;;


 *xterm*|rxvt*|*terminal*|(dt|k|E)term)
	echo "Run it in console"
 ;;
esac
