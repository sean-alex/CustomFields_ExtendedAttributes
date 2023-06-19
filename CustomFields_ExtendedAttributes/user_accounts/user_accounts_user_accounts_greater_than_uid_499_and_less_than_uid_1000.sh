#! /bin/bash
#
# User Accounts - User Accounts Greater Than UID 499 and less than UID 1000
# This would be local, or non-AD, user accounts.
 
over499less1000accounts=$( /usr/bin/dscl . list /Users UniqueID | grep -v _sophos | awk '$2 > 499 && $2 < 1000 { print $1 }' 2>/dev/null )
 
if [ "$over499less1000accounts" == "" ]; then
        echo "No User Accounts in UID 500-999"
else
        echo "$over499less1000accounts"
fi

exit 0