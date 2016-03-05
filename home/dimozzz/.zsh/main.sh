#!/bin/zsh

file=~/.zsh/source

if [ -d $file ]; then
    for i in $file/*; do
		case $i in *~) continue;; esac
        source $i
    done
fi
