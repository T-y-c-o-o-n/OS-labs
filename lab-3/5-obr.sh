#!/bin/bash

mode="add"
val=1
(tail -f pipe) |
while true; do
	read line;
	case "$line" in
		"+" )
			mode="add"
			;;
		"*" )
			mode="mul"
			;;
		"QUIT" )
			break
			;;
		* )
			(echo "$line" | grep -x -q -o -E "[0-9]+") || {
				echo "incorrect data"
				break
			}
			if [[ "$mode" == "add" ]]; then
				let val=val+line
			else
				let val=val*line
			fi
			echo "$val"
			;;
	esac
done

