#!/bin/bash

#before starting run 6-obr.sh

pid=$(cat .pid)
while read line; do
	case "$line" in
		"+" )
			kill -USR1 $pid
			;;
		"*" )
			kill -USR2 $pid
			;;
		"-" )
			kill -URG $pid
			;;
		"TERM" )
			kill -SIGTERM $pid
			break
			;;
	esac
	sleep 1s
done

