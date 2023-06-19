#!/bin/sh

# Get the version on the currently installed Sophos Device Encryption

if [ -e "/usr/local/bin/seadmin" ]; then 

		version="$(/usr/local/bin/seadmin status | awk '/Sophos Encryption seadmin Version/ { print $5 }')"
		echo "$version"
	else
		echo "NotInstalled"
fi

