#!/bin/bash

> info.log
cat /var/log/syslog | awk '{if ($2 == "INFO") print $0}' > info.log

