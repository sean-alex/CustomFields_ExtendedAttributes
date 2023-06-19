#!/bin/bash

result=$( dsconfigad -show | grep "Computer Account" | awk '{print $4}' )

echo "$result"

exit 0
