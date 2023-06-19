#!/bin/bash

result=$( dsconfigad -show | grep "Authentication from any domain" | awk '{print $6,$7}' )

echo "$result"

exit 0
