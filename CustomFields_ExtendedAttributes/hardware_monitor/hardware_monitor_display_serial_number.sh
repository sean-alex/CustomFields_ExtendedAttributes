#!/bin/sh

serial=`system_profiler SPDisplaysDataType | grep -i "Display Serial Number" | sed -e 's/^[ \t]*//' | cut -d " " -f 4`

if [ "$serial" != "" ]; then

echo "$serial"

else

echo "Display Not Found"

fi

exit 0