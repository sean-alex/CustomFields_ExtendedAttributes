#!/bin/bash

result=$( dsconfigad -show | grep "Preferred Domain controller" | awk '{print $5,$6}' )

echo "$result"

exit 0