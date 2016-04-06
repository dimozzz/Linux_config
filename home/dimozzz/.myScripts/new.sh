#!/bin/bash
fetch="ddd eee ccc"
echo $fetch
line="$(echo "$fetch" | sed 's/e/\n/')"
line2="$(echo "$line" | grep 'd')"
echo $line
echo $line2
