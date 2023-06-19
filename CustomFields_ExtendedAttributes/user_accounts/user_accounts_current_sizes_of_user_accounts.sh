#!/bin/bash

# gather list of user accounts and their sizes
# note: in allLocalAccts, add or delete as many accounts you want to exclude from gathering user size

allLocalAccts=$(dscl . list /Users UniqueID | awk '$1 != "_sophos"' | awk '$1 != "_sophosencryption"' | awk '$1 != "_avectodaemon"'| awk '$2>500 {print $1}')

while read userAcct; do
    userAcctSize="$( du -hsx /Users/"$userAcct" 2>/dev/null |awk '{print $1}')"

    userList+=("${userAcct}: $userAcctSize")

done < <(echo "$allLocalAccts")

echo "$(printf '%s\n' "${userList[@]}")"