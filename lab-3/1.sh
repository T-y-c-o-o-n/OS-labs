#!/bin/bash

mkdir test && echo "catalog test was created successfully" > ~/report	
ping www.net_nikogo.ru || echo "Date_Time: $(date) can't ping host www.net_nikogo.ru\n" >> ~/report

