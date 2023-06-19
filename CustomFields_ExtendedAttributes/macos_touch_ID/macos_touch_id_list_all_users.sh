#!/bin/zsh

# This script will list all the users enrolled in Touch ID
# that have "unlock with fingerprint" enabled.

# First, check if the system even supports Touch ID
# If not, bail out and report unsupported.

# For testing purposes only -- document the context under which this script is executed
scriptUser=$(id -u -n)
echo "Script is running as: $scriptUser"

# Test for full disk access
echo "Checking for Full Disk Access..."
if ! plutil -lint /Library/Preferences/com.apple.TimeMachine.plist >/dev/null ; then
  echo "This script requires your terminal app to have Full Disk Access."
  echo "Add this terminal to the Full Disk Access list in System Preferences > Security & Privacy, quit the app, and re-run this script."
  exit 1
else
  echo "This script appears to be running with full disk access..."
fi

touchIDfunctionality=$(/usr/bin/bioutil -rs)
echo "Touch ID functionality call:\n$touchIDfunctionality "

if [[ -z $touchIDfunctionality ]]
then
    echo "Touch ID functionality returned no data -- exiting"
    echo "Unsupported - $touchIDfunctionality"
    exit 0
fi

# Next, list all the users over UID 500 and run 'bioutil' with sudo -u .
# Only capture users that have > 0 fingerprints registered,
# and finally confirm that they have enabled unlocking the Mac.

tidEnrolledUsers=($(for i in $(ls -lan /Users/ | awk '$3 > 500 { print $9 }'); do sudo -u $i /usr/bin/bioutil -c; done | awk '/User/ && !/0 fingerprint/ { print $0 }' | awk '{ print $2 }' | sed "s_:__g" ))
tidUsersArray=()

for i in ${tidEnrolledUsers[@]}
do
    tidUser=$(ls -lan /Users/ | grep "$i" | awk 'BEGIN { RS="" ; FS="\n" } { print $1 }' | awk '{ print $9 }')
    tidStatus=$(/usr/bin/sudo -u "$tidUser" /usr/bin/bioutil -r | awk '/unlock/ && !/Effective/ { print $5 }')
    [[ $tidStatus == "1" ]] && tidUsersArray+=("$tidUser")
done

# Finally, print the results!

if [[ -n $tidUsersArray ]]
then
    echo "Active Users: $tidUsersArray"
else
    echo "Not Enabled for Unlock"
fi