#!/bin/bash

result=$( dsconfigad -show | grep "Active Directory Domain" | awk '{print $5}' )

echo "$result"

exit 0