#!/bin/sh

version=$( defaults read "/Applications/Google Chrome.app/Contents/Info.plist" CFBundleShortVersionString )

# -n flag = string is not null
if [ -n "$version" ] ; then
		echo "$version"
	else
  		echo "NotInstalled"
fi 

exit 0