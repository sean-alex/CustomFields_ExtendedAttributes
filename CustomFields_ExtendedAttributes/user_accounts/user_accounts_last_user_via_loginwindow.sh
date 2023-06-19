#!/bin/bash

lastUserVIAloginwindow=$( defaults read /Library/Preferences/com.apple.loginwindow lastUserName )

echo "$lastUserVIAloginwindow"

exit 0
