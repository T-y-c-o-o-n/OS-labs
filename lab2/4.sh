#!/bin/bash

output="/home/tycoon/lab2/output4"
> $output

cd /proc
for dir in *
do
	if [[ $dir =~ "3" ]]
	then	cd $dir
		awk '$1=="Pid:" { printf("%s ", $2) }' status >> $output
		awk '$1=="PPid:" { printf("%s ", $2) }' status >> $output
		awk -v sum=0 -v nr=0 '$1=="se.sum_exec_runtime" { sum=$3 } $1=="nr_switches" { nr=$3 } END { print sum/nr }' sched >> $output
		cd ..
	fi
done

cd ~/lab2
sort $output -nk2 -n | awk '{print "ProcessID=" $1 " : Parent_ProcessID=" $2 " : Average_Running_Time=" $3}' > temp-file-4
cat temp-file-4 > $output
rm temp-file-4
