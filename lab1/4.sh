#!/bin/bash


if [[ "$PWD" == "$HOME" ]]
then
	echo "$HOME"
	exit 0
else
	echo "ERROR - YOU ARE IN WRONG DIRECTORY!"
	exit 1
fi

