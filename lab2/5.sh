#!/bin/bash

./4.sh

awk -F "=| " -v lastPPid=-1 -v sumAvt=0 -v cnt=0 -v cur=0 'NR == 1 { lastPPid = $5 } $5 != lastPPid { print "\nAverage_Sleeping_Children_of_ParentID=" lastPPid " is " sumAvt/cnt "\n sumAvt : " sumAvt " ; cnt : " cnt; lastPPid=$5; sumAvt=0; cnt=0 } { sumAvt; cur=$8; print cur; sumAvt = 0 + sumAvt + cur; print "sumAvt become " sumAvt; cnt++; print $0 } END { print "\nAverage_Sleeping_Children_of_ParentID=" lastPPid " is " sumAvt/cnt "\n" } ' output4 > output5

