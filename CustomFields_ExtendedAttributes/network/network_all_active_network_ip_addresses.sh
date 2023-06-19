#!/bin/bash

# REFERENCE: https://gist.github.com/homebysix/74129871b1d934408be4

# Create result string.
RESULT=""

# Generate list of all active network device ports (e.g. en0, en1).
DEVICE_PORTS="$(ifconfig | awk -F: '/<UP,BROADCAST,SMART,RUNNING,/{print $1}' | sort 2> /dev/null)
$(ifconfig | awk -F: '/<UP,POINTOPOINT,RUNNING,/{print $1}' | sort 2> /dev/null)"

# Save output of networksetup for future lookup of friendly port names.
NETWORKSETUP=$(networksetup -listallhardwareports)

# Iterate through active ports.
for PORT in $DEVICE_PORTS; do

    # Get IP address of this port.
    THIS_IP=$(ifconfig "$PORT" | awk '/inet /{print $2}' 2> /dev/null)

    # If the IP is not blank, then add its information to the result string.
    if [[ "$THIS_IP" != "" ]]; then

        THIS_NAME=$(echo "$NETWORKSETUP" | sed -n "/Device: $PORT/{g;1!p;};h" | awk '{print substr($0, index($0,$3))}')

        # If the port doesn't have a name in networksetup, use "Other."
        if [[ -z $THIS_NAME ]]; then

            # For interfaces with no name in networksetup, we have to resort to system_profiler. Would love to combine this grep/head/awk. Open to suggestions.
            THIS_NAME=$(system_profiler SPNetworkDataType | grep -B3 "BSD Device Name: $PORT" | head -1 | colrm 1 4 | awk -F: '{print $1}')

            if [[ -z $THIS_NAME ]]; then

                # If we still don't have a usable name, use "Other."
                THIS_NAME="Other"

            fi

        fi

        # Add a line feed between each port's output.
        if [[ -n $RESULT ]]; then
            RESULT+="
"
        fi

        RESULT+="$THIS_NAME ($PORT): $THIS_IP"
    fi

done

# Send the result string back to the JSS.
echo "$RESULT"

exit 0
