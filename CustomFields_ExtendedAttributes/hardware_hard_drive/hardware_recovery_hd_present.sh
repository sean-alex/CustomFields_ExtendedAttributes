#!/bin/sh

recoveryHDPresent="$(/usr/sbin/diskutil list | grep "Recovery HD" | grep disk0)"

if [ "$recoveryHDPresent" != "" ]; then
	echo "Present"
else
	echo "Not Present"
fi