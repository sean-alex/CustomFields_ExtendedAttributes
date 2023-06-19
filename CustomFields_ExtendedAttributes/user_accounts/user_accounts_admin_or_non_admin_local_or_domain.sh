#!/bin/bash

# check user accounts status -->  Admin or Non-Admin, Local or Domain
# REFERENCE: https://www.jamf.com/jamf-nation/feature-requests/2065/smart-group-for-local-users-marked-as-admin#responseChild10170
# MODIFICATIONS:
# -- modified allLocalAccts variable to exclude any user accounts created by applications, such as:
# 	the _sophos account created by Sophos
# -- Made Domain or Local as first output, so that can better distinguish between Admin and Non-Admin

allLocalAccts=$(dscl . list /Users UniqueID | awk '$1 != "_sophos"' | awk '$1 != "_sophosencryption"' | awk '$1 != "_avectodaemon"'| awk '$2>500 {print $1}')

while read userAcct; do
    if [[ $(dseditgroup -o checkmember -m $userAcct admin) =~ "yes" ]]; then
        Admin="Admin"
    else
        Admin="Non-Admin"
    fi

    if [[ $(dscl . read /Users/$userAcct OriginalAuthenticationAuthority 2>/dev/null) != "" ]]; then
        Domain="Domain"
    else
        Domain="Local"
    fi

    userList+=("${userAcct}: $Domain, $Admin")

done < <(echo "$allLocalAccts")

echo "$(printf '%s\n' "${userList[@]}")"