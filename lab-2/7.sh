#!/bin/bash

Pids=$(ls /proc | grep -E "[0-9]+")

tmp="$PWD/.temp-data-4"
> $tmp

for Pid in $Pids
do
	if [[ -f /proc/$Pid/io ]]
	then
		sudo awk '$1=="read_bytes:" {print '$Pid' " " $2}' /proc/$Pid/io >> $tmp
	fi
done

sleep 10s

tmp2="$PWD/.temp-data2-4"
> $tmp2

while read line
do
	curPid=$(echo "$line" | awk '{print $1}')
	bytesWas=$(echo "$line" | awk '{print $2}')
	if [[ -f /proc/$curPid/io ]]
	then
		bytesNow=$(sudo awk '$1=="read_bytes:" {print $2}' /proc/$curPid/io)
	fi
	let curBytes=bytesNow-bytesWas
	#	echo "$curBytes = $bytesNow - $bytesWas"
	echo "$curPid $curBytes $(cat /proc/$curPid/cmdline)" >> $tmp2
done < $tmp

cat $tmp2

sort -nk2 -n $tmp2 | tail --lines=3

