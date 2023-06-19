#!/bin/zsh
#------------------------------------------------------------------------------
#
# Author: Mahlman, John
# Creation Date: Jan 23,2020
#
# Modification: Sean Alexander
# - removed jamf-specific code
# - changed vm prefs
#------------------------------------------------------------------------------

vm=()
mkdir -p "/Library/Management/logs/VM/"
vm_prefs="/Library/Management/logs/VM/vbox-vms-found"

# Cleanup file to start fresh
[ -f "$vm_prefs" ] && rm "$vm_prefs"
touch "$vm_prefs"

# Lets find all vbox files and put them in an array.
while IFS= read -r line
do
  vm+=( "$line" )
done < <(find "/Users" -name "*.vbox" -maxdepth 6 -print 2>/dev/null )

for configs in "${vm[@]}"; do
  echo "$configs, guessing OS: $(cat $configs | grep OSType | sed 's/.*OSType="\([a-zA-Z0-9_]*\)".*/\1/')" >> "$vm_prefs"
done

echo "$(cat "$vm_prefs")"
