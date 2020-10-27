#!/bin/bash

while true; do
	read line;
	echo "$line" > pipe &
	
	case "$line" in
		"+"|"*" )
			continue
			;;
		"QUIT" )
			break
			;;
		* )
			(echo "$line" | grep -x -q -o -E "[0-9]+") || {
				echo "incorrect input"
				break;
			}
			;;
	esac
done

