#!/bin/zsh

awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master)
