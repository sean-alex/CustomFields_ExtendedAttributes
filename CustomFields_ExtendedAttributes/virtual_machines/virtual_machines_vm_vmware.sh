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
vm_prefs="/Library/Management/logs/VM/vmware-vms-found"

# Cleanup file to start fresh
[ -f "$vm_prefs" ] && rm "$vm_prefs"
touch "$vm_prefs"

# Lets find all VMWare Fusion VMX files and put them in an array.
while IFS= read -r line
do
  vm+=( "$line" )
done < <(find "/Users" -name "*.vmx" -maxdepth 6 -print 2>/dev/null )

for configs in "${vm[@]}"; do
  echo "$configs, guessing OS: $(cat $configs | grep guestOS\ \= | awk '{print $3}' | tr -d '""' )" >> "$vm_prefs"
done

echo "$(cat "$vm_prefs")"
