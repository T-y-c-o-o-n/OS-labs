#!/bin/bash

if [[ $# -lt 10 ]]
then
	#echo "$#"
	#echo $@
	#echo $*
	#echo "$*" #| awk  '{print "parameter " $NR " = " $0}'
	no=0
	for par;
	do
		let no=$no+1
		echo "parameter $no = $par"
	done
fi

