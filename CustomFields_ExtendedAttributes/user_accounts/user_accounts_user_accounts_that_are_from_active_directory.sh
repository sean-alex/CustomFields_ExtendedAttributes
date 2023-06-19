#! /bin/bash
#
# User Accounts - User Accounts that are from Active Directory
#
 
ADaccounts=$( /usr/bin/dscl . list /Users OriginalNodeName | awk '{print $1}' 2>/dev/null )

if [ "$ADaccounts" == "" ]; then
        echo "No AD Accounts"
else
        echo "$ADaccounts"
fi

exit 0
