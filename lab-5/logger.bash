#!/bin/bash

while true; do
	echo "" >> report-1
	echo "system memory:" >> report-1
	top -b -n 1 | head --lines=5 | tail --lines=2 >> report-1
	echo "working scripts:" >> report-1
	top -b -n 1 | grep "mem[2]*.bash" >> report-1
	echo "top 5 processes:" >> report-1
	top -b -n 1 | head --lines=12 | tail --lines=6 >> report-1
	check=$(top -b -n 1 | grep "mem[2]*.bash" || printf "no")
	if [[ "$check" == "no" ]]; then
		break;
	fi
	sleep 10s
done

