#!/bin/bash

./4.sh

awk -F "=| " -v lastPPid=0 -v sumAvt=0 -v cnt=0 -v cur=0 '$5 != lastPPid { print "\nAverage_Sleeping_Children_of_ParentID=" lastPPid " is " sumAvt/cnt "\n"; lastPPid=$5; sumAvt=0; cnt=0 } { cur=$8; sumAvt = 0 + sumAvt + cur; cnt++; print $0 } END { print "\nAverage_Sleeping_Children_of_ParentID=" lastPPid " is " sumAvt/cnt "\n" } ' output4 > output5

