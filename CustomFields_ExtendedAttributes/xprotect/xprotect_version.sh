#!/bin/bash

xPROTECTversion=$( defaults read /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/XProtect.meta.plist Version )

echo "$xPROTECTversion"

exit 0