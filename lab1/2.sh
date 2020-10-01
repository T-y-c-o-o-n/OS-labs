#!/bin/bash

while true
do
read str
if [[ "$str" == "q" ]]
then break
fi
res="$res$str"
done

echo $res

