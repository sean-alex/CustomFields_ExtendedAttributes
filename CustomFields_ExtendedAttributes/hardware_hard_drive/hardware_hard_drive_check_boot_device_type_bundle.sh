#!/bin/sh

driveFormat=$( /usr/sbin/diskutil info / | awk '/Type \(Bundle\)/ {print $3}' )

echo "$TypeBundle"