#!/bin/sh

nameUserVisible=$( /usr/sbin/diskutil info / | awk '/Name \(User Visible\)/ {print $4}' )

echo "$nameUserVisible"