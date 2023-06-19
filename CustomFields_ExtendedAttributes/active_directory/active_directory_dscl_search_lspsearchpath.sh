#!/bin/bash

result=$( dscl /Search -read / | awk '/LSPSearchPath:/ { print $2 }' )

echo "$result"

exit 0
