#!/bin/zsh

# Get the version on the currently installed Sophos Client

version=$(defaults read "/Library/Sophos Anti-Virus/product-info.plist" ProductVersion)

if [[ -n $version ]];then
	echo "$version"
else
	echo "NotInstalled"
fi