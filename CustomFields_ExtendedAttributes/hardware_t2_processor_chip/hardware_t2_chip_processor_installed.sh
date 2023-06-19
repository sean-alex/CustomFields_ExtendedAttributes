#!/bin/sh

# check chip found in Controller Information

checkChip=$( system_profiler SPiBridgeDataType | awk -F: '/Model Name/ {print $NF}' | sed 's/^ *//' )

if [[ "$checkChip" == "" ]]; then
      echo "NotInstalled"
   else
      echo "$checkChip"
fi
exit