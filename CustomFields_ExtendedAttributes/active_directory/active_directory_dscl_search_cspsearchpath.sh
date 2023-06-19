#!/bin/bash

result=$( dscl /Search -read / | awk '/CSPSearchPath:/ { getline; print; getline; print }' )

echo "$result"

exit 0