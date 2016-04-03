#!/bin/zsh

if [ "${#@}" = "2" ]; then
	sudo scanimage --mode=Gray --resolution="$2" > "$1".png
else
	sudo scanimage --mode=Gray --resolution=100 > "$1".png
fi

convert "$1".png pdf/"$1".pdf
