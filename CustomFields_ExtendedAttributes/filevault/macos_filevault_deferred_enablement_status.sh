#!/bin/bash 
 
fdesetupStatus=$(fdesetup status) 
 
if [[ $fdesetupStatus == *"Deferred enablement appears to be active"* ]]; then 
	# echo "Deferred enablement active" 
 	result="Deferred enablement active"
 
else 
	# echo "Deferred enablement not active" 
	result="Deferred enablement not active"
 
fi 
 
echo "$result"