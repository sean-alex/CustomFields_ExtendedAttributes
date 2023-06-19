#!/bin/sh

# Get the Last Synchronization on the currently installed Sophos Device Encryption

if [ -e "/usr/local/bin/seadmin" ]; then 

		regexVAR="$(/usr/local/bin/seadmin status | awk -F"Synchronization: " '/Last Synchronization:/ { print $NF }')"
		echo "$regexVAR"
	else
		echo "NotInstalled"
fi

