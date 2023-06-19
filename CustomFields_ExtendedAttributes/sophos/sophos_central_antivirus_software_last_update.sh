#!/bin/zsh

# Date of the last update
# Configure as date extension attribute

# Configure the timezone of the output
export TZ="GMT-5"

echo "$(/bin/date -jf "%s" "$(defaults read /Library/Caches/com.sophos.sau/sophosautoupdate.plist LastTimeStamp)" "+%Y-%m-%d %H:%M:%S %Z")"