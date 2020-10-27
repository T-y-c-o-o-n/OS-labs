#!/bin/bash

pid=$(cat .pid)
while read line; do
	case "$line" in
		"+" )
			kill -USR1 $pid
			;;
		"*" )
			kill -USR2 $pid
			;;
		"TERM" )
			kill -TERM $pid
			break
			;;
	esac
	sleep 1s
done

