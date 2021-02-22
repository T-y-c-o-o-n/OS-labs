#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo "usage $0 <stop size>"
	exit 0
fi

tenElems=(1 2 3 4 5 6 7 8 9 10)
array=()
size=0

while true; do
	for el in ${tenElems[@]}; do
		array+=( $el )
	done
	let size+=10
	if [[ $size -ge $1 ]]; then
		echo "reached the limit" >> "success.log"
		break;
	fi
done

