#! /bin/bash
#
# User Accounts - User Accounts Greater Than UID 499
#
 
over499accounts=$( /usr/bin/dscl . list /Users UniqueID | grep -v _sophos | awk '$2 > 499 { print $1 }' 2>/dev/null )

if [ "$over499accounts" == "" ]; then
        echo "No User Accounts Greater Than UID 499"
else
        echo "$over499accounts"
fi

exit 0
