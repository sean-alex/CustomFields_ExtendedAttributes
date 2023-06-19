#!/bin/zsh

# Check when the last connection to Sophos Central has been made
# Use date type extension attribute

echo "$( /usr/libexec/PlistBuddy -c 'Print SMEMcsLastCommunications:SMEMcsLastSuccessCommunicationTimestamp' /Library/Preferences/com.sophos.mcs.plist )"