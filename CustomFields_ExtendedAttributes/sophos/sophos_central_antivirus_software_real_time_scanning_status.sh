#!/usr/bin/env bash
####################################################################################
# A script to collect the state of Sophos Endpoint's "Real Time Scanning > Files". #
# If Sophos Endpoint is not installed, "NotInstalled" will be returned.           #
# If "Real Time Scanning > Files" is disabled, "Disabled" will be returned.        #
####################################################################################

RESULT="NotInstalled"

if [[ -d /Applications/Sophos/Sophos\ Endpoint.app ]]; then
    if [[ -f /Library/Preferences/com.sophos.sav.plist ]]; then
        sophosOnAccessRunning=$( /usr/bin/defaults read /Library/Preferences/com.sophos.sav.plist OnAccessRunning )
        case ${sophosOnAccessRunning} in
            "0" ) RESULT="Disabled" ;;
            "1" ) RESULT="Enabled" ;;
             *  ) RESULT="Unknown" ;;
        esac
    else
        RESULT="NotFound"
    fi
fi

/bin/echo "${RESULT}"