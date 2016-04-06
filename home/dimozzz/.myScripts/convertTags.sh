#!/bin/zsh

cd "${1}"
for i in *.mp3;
do
	mid3iconv -e cp1251 "${i}"
done
