#!/bin/bash

tmp="$PWD/.temp-data-4"
> $tmp

for dir in $(ls /proc | grep -E "[0-9]+")
do
	if [[ -d /proc/$dir ]]
	then
		awk '$1=="Pid:" { printf("%s ", $2) }' /proc/$dir/status >> $tmp
		awk '$1=="PPid:" { printf("%s ", $2) }' /proc/$dir/status >> $tmp
		awk -v sum=0 -v nr=0 '$1=="se.sum_exec_runtime" { sum=$3 } $1=="nr_switches" { nr=$3 } END { print sum/nr }' /proc/$dir/sched >> $tmp
	fi
done

sort $tmp -nk2 -n | awk '{print "ProcessID=" $1 " : Parent_ProcessID=" $2 " : Average_Running_Time=" $3}' > output4
rm $tmp

