#!/bin/bash

bootstrap=$(profiles status -type bootstraptoken)

if [[ $bootstrap == *"supported on server: YES"* ]]; then

 	result="Supported";
else

	result="NotSupported"

fi

echo "$result"
