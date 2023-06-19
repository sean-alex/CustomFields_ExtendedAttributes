#!/bin/sh

fileSystemPersonality=$( /usr/sbin/diskutil info / | awk '/Name \(User Visible\)/ {print $4}' )

echo "$fileSystemPersonality"