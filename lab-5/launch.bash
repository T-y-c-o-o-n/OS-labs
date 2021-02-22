#!/bin/bash

./mem.bash &
./mem2.bash &
sleep 5s
./logger.bash &

