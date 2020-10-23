#!/bin/bash

ps a u x | awk -v res=0 '$1 == "tycoon" { res++; } END { print res }' > output1
ps a u x | awk '{ if ($1 == "tycoon") print $2":"$11 }' >> output1

