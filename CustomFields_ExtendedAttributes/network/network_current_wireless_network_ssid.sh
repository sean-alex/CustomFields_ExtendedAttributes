#!/bin/zsh

/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/ {print $2}'  | sed -e 's/^[ \t]*//'