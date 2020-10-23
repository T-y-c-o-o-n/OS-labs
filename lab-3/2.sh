#!/bin/bash

{
	sleep 10s
	./1.sh
} &
tail -f ~/report

