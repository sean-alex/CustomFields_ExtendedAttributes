#!/bin/sh

# Get the encryption status on the currently installed Sophos Device Encryption

if [ -e "/usr/local/bin/seadmin" ]; then 

		regexVAR="$(/usr/local/bin/seadmin status --device-encryption | awk -F"Encryption Status: " '/Encryption Status:/ { print $NF }')"
		echo "$regexVAR"
	else
		echo "NotInstalled"
fi

