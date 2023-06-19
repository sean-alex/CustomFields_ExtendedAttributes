#!/bin/bash      
      
NumberOfSecureToken=$( /usr/bin/fdesetup list | wc -l | sed -e 's/^[[:space:]]*//' )

echo "$NumberOfSecureToken"