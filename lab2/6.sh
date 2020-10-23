#!/bin/bash

maxMem=-1
mem=0
procName="undefined"
for dir in $(ls /proc | grep -E "[0-9]+")
do
	if [[ -d "/proc/$dir" ]]
	then
		mem=$(awk '{ print $1 }' /proc/$dir/statm)
		if [[ $maxMem -lt $mem ]]
		then	maxMem=$mem
			procName=$dir
		fi
	fi
done

echo "$procName - $maxMem bytes"

