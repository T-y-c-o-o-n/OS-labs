#!/bin/bash

ps -eF | awk '{ if ($2 != '$$' && $3 != '$$') { print $2 " - " $8 } }' | tail --lines=1


