#!/bin/bash

bootstrap=$(profiles status -type bootstraptoken)

if [[ $bootstrap == *"escrowed to server: YES"* ]]; then
	# echo "YES, Bootstrap escrowed";
 	result="Escrowed";
else
	# echo "NO, Bootstrap not escrowed"
	result="NotEscrowed"

fi

echo "$result"