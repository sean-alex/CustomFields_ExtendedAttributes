#! /bin/bash
#
# FileWave client will execute this script. The output will be used as the value of the custom field.
# 
# Below is an example of how to read the value of one ENVIRONMENT VARIABLE in your script:

# my_var=${ENV_VAR_NAME}
#

# grab battery cycle count

batteryCycle=$(system_profiler SPPowerDataType | awk '/Cycle Count/ { print $3 }')

echo "${batteryCycle} cycles"

exit 0