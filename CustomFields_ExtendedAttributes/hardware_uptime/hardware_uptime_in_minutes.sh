#!/bin/zsh

# REFERENCES: 
# https://github.com/SecondSonConsulting/Renew

# Determine current Unix epoch time
current_unix_time="$(date '+%s')"

# This reports the unix epoch time that the kernel was booted
boot_unix_time="$(sysctl -n kern.boottime | awk -F 'sec = |, usec' '{ print $2; exit }')"

#Get uptime in seconds by doing maths
uptime_seconds="$(( current_unix_time - boot_unix_time ))"

uptime_minutes="$(( uptime_seconds / 60 ))"
# uptime_hours="$(( uptime_minutes / 60 ))"
# uptime_days="$(( uptime_hours / 24 ))"

echo "$uptime_minutes"