#!/bin/bash

ps a u x | grep "\^/sbin/" | awk '{ print $2 }' > output2
