#!/bin/bash

K=30
N=1500000

> success.log

for ((i=0; i < $K; i++))
do
	./newmem.bash $N  &
	sleep 1
done

