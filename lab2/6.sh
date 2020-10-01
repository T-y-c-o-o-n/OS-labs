#!/bin/bash

maxMem=-1
mem=0
procName="undefined"
for dir in /proc/*
do
	if [[ $dir =~ "3" ]]
	then
		mem=$(awk '{ print $1 }' $dir/statm)
		if [[ $maxMem -lt $mem ]]
		then	maxMem=$mem
			procName=$dir
		fi
	fi
done

echo "$procName - $maxMem bytes"

