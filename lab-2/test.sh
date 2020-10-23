#!/bin/bash


file="$PWD/temp-data"
> $file

cd /proc
for dir in *
do
	echo "$dir" | awk '/[0-9]+/{print $0}' >> $file
done


while read dir

cat $file
rm $file

