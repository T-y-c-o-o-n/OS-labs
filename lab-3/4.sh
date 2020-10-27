#!/bin/bash

./mul.sh &
./mul.sh &
./mul.sh &


first=$(ps -eo pid,command | awk '$2=="/bin/bash" && $3=="./mul.sh" {print $1}' | head --lines=1) 
last=$(ps -eo pid,command | awk '$2=="/bin/bash" && $3=="./mul.sh" {print $1}' | tail --lines=1) 
cpulimit --pid=$first --limit=9 -b
kill $last


