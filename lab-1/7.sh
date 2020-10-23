#!/bin/bash

grep -s -h -a -o -E "[a-z0-9\.-]+@[a-z0-9-]+\.[a-z0-9\.-]+" -r /etc | sort | uniq |  awk '{printf (FNR==1?"":", ")$0}END{print""}' > emails.lst

