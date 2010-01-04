#!/bin/zsh

if [ "${#@}" = "4" ];  then
	mpc search "${1}" "${3}" "${2}" "${4}" | mpc -v add 
else
	mpc search "${1}" "${2}" | mpc -v add
fi
