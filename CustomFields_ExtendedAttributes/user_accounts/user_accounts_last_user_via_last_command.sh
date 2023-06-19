#!/bin/bash

lastUserVIAlast=$( /usr/bin/last -1 -t console | awk '{print $1}' )

echo "$lastUserVIAlast"

exit 0
