#!/bin/bash

echo "$$" > .pid
val=1
mode="working"
usr1()
{
	let val+=2
}
usr2()
{
	let val*=2
}
urg()
{
	let val-=2
}
term()
{
	echo "finished working by SIGTERM"
	mode="finish"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'urg' URG
trap 'term' SIGTERM

while [[ "$mode" == "working" ]]; do
	echo "$val"
	sleep 1s
done

