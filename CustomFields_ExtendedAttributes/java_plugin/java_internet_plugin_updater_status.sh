#!/bin/bash

JavaInternetPlugin="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin"

if [ -e "${JavaInternetPlugin}" ]; then
	var=$(defaults read /Library/Preferences/com.oracle.java.Java-Updater JavaAutoUpdateEnabled)
	
	case $var in
	0) result="Disabled"
	;;
	1) result="Enabled"
	;;
	*) result="Unknown"
	;;
	esac
else
	result="NotInstalled"
fi

echo "$result"

exit 0
