#!/bin/bash

mkdir $HOME/test 2> /dev/null && echo "catalog test was created successfully" >> ~/report	
ping www.net_nikogo.ru 2> /dev/null || echo "Date_Time: $(date +%F_%R) can't ping host www.net_nikogo.ru" >> ~/report

