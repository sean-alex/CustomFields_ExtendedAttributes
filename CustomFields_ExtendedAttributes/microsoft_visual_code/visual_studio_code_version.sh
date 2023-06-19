#!/bin/bash

version="$( defaults read /Applications/Visual\ Studio\ Code.app/Contents/Info.plist CFBundleShortVersionString )"

# -n flag = string is not null
if [ -n "$version" ] ; then
		echo "$version"
	else
  		echo "NotInstalled"
fi 

exit 0
