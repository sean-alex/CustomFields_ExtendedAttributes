#!/bin/bash  
  
fdesetupStatus=$(fdesetup status)  
#fdesetupStatus="Deferred enablement appears to be active for user 'ttg'"  
  
if [[ $fdesetupStatus == *"Deferred enablement appears to be active"* ]]; then  
	  
	# echo "Deferred enablement active"  
  
	echo $fdesetupStatus  
  
	#deferredUser=($(fdesetup status | grep user))  
	deferredUser=$(echo $fdesetupStatus | sed 's/.*user\ //' | sed "s/'// " | sed "s/'// " | sed "s/\.// ")  
  
	# echo $deferredUser  
  
 	result="$deferredUser"  
  
else  
	# echo "Deferred enablement not active"  
	result="Deferred enablement not active"  
  
fi  
  
echo "$result"
