#! /bin/bash
#
# FileWave client will execute this script. The output will be used as the value of the custom field.
# 
# Below is an example of how to read the value of one ENVIRONMENT VARIABLE in your script:

# my_var=${ENV_VAR_NAME}
#

# Battery Health Status
result=`ioreg -r -c "AppleSmartBattery" | grep "PermanentFailureStatus" | awk '{print $3}' | sed s/\"//g`

if [ "$result" == "1" ]; then
result="Failure"
elif [ "$result" == "0" ]; then
result="OK"
fi

echo "$result"