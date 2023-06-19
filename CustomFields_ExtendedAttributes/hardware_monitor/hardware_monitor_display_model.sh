#!/bin/bash
DisplayModel=`system_profiler SPDisplaysDataType | grep "Resolution:" -B1 | awk -v n=3 'NR%n==1' | sed "s/^[ \t]*//" | sed 's/:/,/g' | tr '\n' ' '`
echo ${DisplayModel}
exit 0