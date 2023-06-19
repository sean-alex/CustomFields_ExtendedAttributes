#! /bin/bash
#
# FileWave client will execute this script. The output will be used as the value of the custom field.
#
# Below is an example of how to read the value of one ENVIRONMENT VARIABLE in your script:
 
# my_var=${ENV_VAR_NAME}
#
 
/usr/bin/dscl . -read /Groups/admin GroupMembership | cut -d " " -f 3- | tr " " ","
 
exit 0
