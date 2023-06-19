#!/bin/bash

# Check what Apple ID is signed in on a device 
# REFERENCE: https://support.addigy.com/hc/en-us/articles/4403726469779-How-To-Restrict-iCloud-Apple-ID-Usage-on-macOS

for user in $(dscl . list /Users UniqueID | awk '$2 >= 500 {print $1}'); do
    userHome=$(dscl . read /Users/"$user" NFSHomeDirectory | sed 's/NFSHomeDirectory://' | grep "/" | sed 's/^[ \t]*//')
    appleid=$(dscl . readpl "${userHome}" dsAttrTypeNative:LinkedIdentity appleid.apple.com:linked\ identities:0:full\ name 2> /dev/null | awk -F'full name: ' '{print $2}')
    if [[ "${appleid}" == "" ]]; then
    	# sending output to null because do not need this information
        echo "No AppleID for user:${user}" > /dev/null 2>&1
    else
        echo "username:${user} AppleID:${appleid}"
    fi
done
