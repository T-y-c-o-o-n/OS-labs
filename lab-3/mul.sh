#!/bin/bash

prod=1
n=1
while true; do
	let prod=prod*n
	let n++
	if [[ $prod -eq 0 ]]; then
		prod=1
	fi
done

