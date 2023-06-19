#!/bin/sh

# An Extension Attribute script for Mac portable battery health

# REFERENCE:
# https://community.jamf.com/t5/jamf-pro/i-ve-got-the-power/td-p/261244


IFS=$'\n'
mdlid="$(/usr/libexec/PlistBuddy -c "print 0:_items:0:machine_model" /dev/stdin <<< $(/usr/sbin/system_profiler -xml SPHardwareDataType) 2> /dev/null)"
if ! echo "$mdlid" | /usr/bin/grep -i -q 'book'
then
	echo "no"
    exit
fi

pwrdata=($(/usr/libexec/PlistBuddy \
-c "print 0:_items:0:sppower_battery_health_info:sppower_battery_health" \
-c "print 0:_items:0:sppower_battery_health_info:sppower_battery_cycle_count" \
-c "print 0:_items:0:sppower_battery_health_info:sppower_battery_health_maximum_capacity" \
-c "print 0:_items:0:sppower_battery_charge_info:sppower_battery_max_capacity" \
-c "print 0:_items:0:sppower_battery_model_info:sppower_battery_manufacturer" \
-c "print 0:_items:0:sppower_battery_model_info:sppower_battery_firmware_version" \
-c "print 0:_items:0:sppower_battery_model_info:sppower_battery_hardware_revision" \
-c "print 0:_items:0:sppower_battery_model_info:sppower_battery_cell_revision" \
/dev/stdin <<< $(/usr/sbin/system_profiler -xml SPPowerDataType) 2> /dev/null)) 

result(){
echo "Health = ${pwrdata[0]}"
echo "Cycle Count = ${pwrdata[1]}"
if [[ "${pwrdata[2]}" == *'%'* ]]
then
	echo "Max Capacity = ${pwrdata[2]}"
else
	echo "Max Capacity = ${pwrdata[2]} mAh"
fi
if ! [[ "$(/usr/bin/uname -m)" == 'arm64' ]]
then
	i=6
	echo "Manufacturer = ${pwrdata[i-3]}"
else
	i=5
fi
echo "Firmware Version= ${pwrdata[i-2]}"
echo "Hardware Revision = ${pwrdata[i-1]}"
echo "Cell Revision = ${pwrdata[i]}"
}
echo "$(result)"