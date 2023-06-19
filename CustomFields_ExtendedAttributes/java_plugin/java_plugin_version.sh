#!/bin/bash

if [ -e "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin" ] ; then 
		RESULT=$( defaults read "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Info.plist" CFBundleVersion )
	else
		RESULT="NotInstalled"
fi

echo "$RESULT"
