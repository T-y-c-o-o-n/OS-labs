#!/bin/bash

tenElems=(1 2 3 4 5 6 7 8 9 10)
array=()
it=0
> report.log

while true; do
	for el in ${tenElems[@]}; do
		array+=( $el )
	done
	let it+=1
	if [[ "$(($it % 100000))" -eq 0 ]]; then
		echo "${#array[*]}" >> report.log
	fi
done

