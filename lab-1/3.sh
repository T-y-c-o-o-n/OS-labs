#!/bin/bash

while true
do
echo "n - for nano"
echo "v - for v"
echo "l - for links"
echo "e - for exit"
read cmd
case "$cmd" in
"n" )
nano
;;
"v" )
vi
;;
"l" )
links
;;
"e" )
exit 0
esac
done

