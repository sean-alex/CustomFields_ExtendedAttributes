#!/bin/bash

csrstatus=$(/usr/sbin/system_profiler SPSoftwareDataType | /usr/bin/awk '/System Integrity Protection:/{print $NF}')
if [ "$csrstatus" = "" ]
then
    echo "NotSupported"
else
    echo "$csrstatus"
fi