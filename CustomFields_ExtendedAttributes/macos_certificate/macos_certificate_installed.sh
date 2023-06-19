#!/bin/bash

# reference: https://community.jamf.com/t5/jamf-pro/verify-the-existence-of-a-system-keychain-certificate/td-p/190019

CERTNAME=""

## Default result. Gets changed to "Yes" if the Root CA is found
result="NotInstalled"

while read cert_entry; do
    if [ "$cert_entry" == "$CERTNAME" ]; then
        		result="Installed"
    fi
done < <(security find-certificate -a /Library/Keychains/System.keychain | awk -F'"' '/alis/{print $4}')

echo "$result"