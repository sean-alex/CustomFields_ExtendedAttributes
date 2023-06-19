#!/bin/zsh

echo "$(/usr/libexec/PlistBuddy -c 'Print SAVIVersion:EngineVersion' /Library/Preferences/com.sophos.sav.plist)"