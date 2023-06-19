#! /bin/bash
#
# FileWave client will execute this script. The output will be used as the value of the custom field.
#
# Below is an example of how to read the value of one ENVIRONMENT VARIABLE in your script:
 
# my_var=${ENV_VAR_NAME}
#
 
# REFERENCE: https://kb.filewave.com/pages/viewpage.action?pageId=3511208

declare -a VisibleAdmins=()
 
function check_hidden {
 
    while [ $# -gt 0 ]
    do
        IsHidden=$(dscl . read /Users/$1 IsHidden 2>/dev/null | awk '{print $NF}')
     
        if [[ ! $IsHidden -eq 1 ]]
        then
            VisibleAdmins+=($1)
        fi 
 
        shift
    done
}
 
check_hidden $(/usr/bin/dscl . -read /Groups/admin GroupMembership | cut -d " " -f 3-)
 
echo ${VisibleAdmins[@]} | tr " " ","
 
exit 0