#! /bin/bash
#

userName="$(/bin/ls -l /dev/console | awk '{print$3}')"

echo "$userName"