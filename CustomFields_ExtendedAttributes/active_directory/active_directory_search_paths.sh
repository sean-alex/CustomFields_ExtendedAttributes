#!/bin/bash

result=$( dscl /Search -read / | grep "/Active Directory/" | sort -u )

echo "$result"

exit 0