#!/bin/bash

result=$( dsconfigad -show | grep "Active Directory Forest" | awk '{print $5}' )

echo "$result"

exit 0