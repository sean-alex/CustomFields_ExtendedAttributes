#!/bin/sh

# Script to find the last time Apple updated Xprotect on a target computer.

XPROTECT="$(stat -f '%Sm' -t '%F %T' /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/XProtect.meta.plist)"

echo "$XPROTECT"

exit 0