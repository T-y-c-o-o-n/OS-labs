#!/bin/bash

left=0
right=1000000000000
while [[ $($left+1) -le $right ]]; do
	let mid=$($left + $right)
	echo $mid

done

