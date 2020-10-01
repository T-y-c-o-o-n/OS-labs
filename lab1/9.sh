#!/bin/bash

sudo wc -l /var/log/*.log | tail --lines=1 | awk '{print $1}'

