#!/bin/zsh

ffmpeg -i "$1".ape "$1".wav
lame -b 320 "$1".wav "$1".mp3
mp3splt -1 -2 -o @n+-+@t -a -c "$1".cue "$1".mp3
rm "$1".wav
#rm "$1".mp3
