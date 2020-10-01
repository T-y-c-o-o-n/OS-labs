#/bin/bash

man bash | awk '{ for (i = 1; i <= NF; ++i) if (length($i) >= 4) print $i }' | sort | uniq -c | sort -nk1 | tail --lines=3 | awk '{ print $2 }'

