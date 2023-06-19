#!/bin/sh

# Will reply Set if Find My Mac is set for this Mac
# REFERENCE: https://support.addigy.com/hc/en-us/articles/4403726469779-How-To-Restrict-iCloud-Apple-ID-Usage-on-macOS

fmmToken=$(/usr/sbin/nvram -x -p | /usr/bin/grep fmm-mobileme-token-FMM)

if [ -z "$fmmToken" ];
then
    echo "NotSet"
else
    echo "Set"
fi