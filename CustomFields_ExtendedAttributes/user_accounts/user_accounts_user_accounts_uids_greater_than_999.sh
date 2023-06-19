#! /bin/bash
#
# User Accounts - User Accounts Greater Than UID 999
#
 
over999useraccounts=$( /usr/bin/dscl . list /Users UniqueID | grep -v _sophos | awk '$2 > 999 { print $1 }' 2>/dev/null )
 
if [ "$over999useraccounts" == "" ]; then
        echo "No User Accounts Greater Than UID 999"
else
        echo "$over999useraccounts"
fi

exit 0