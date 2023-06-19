#!/bin/sh

# REFERENCES: 
# https://gist.github.com/ioagel/7f72863b40ed3d7c3b1d60a4d1a081c1
# https://stackoverflow.com/questions/28353409/bash-format-uptime-to-show-days-hours-minutes

uptime -p >/dev/null 2>&1

if [ "$?" -eq 0 ]; then
  # Supports most Linux distro
  # when the machine is up for less than '0' minutes then
  # 'uptime -p' returns ONLY 'up', so we need to set a default value
  UP_SET_OR_EMPTY=$(uptime -p | awk -F 'up ' '{print $2}')
  UP=${UP_SET_OR_EMPTY:-'less than a minute'}
else
  # Supports Mac OS X, Debian 7, etc
  UP=$(uptime | sed -E 's/^[^,]*up *//; s/mins/minutes/; s/hrs?/hours/;
  s/([[:digit:]]+):0?([[:digit:]]+)/\1 hours, \2 minutes/;
  s/^1 hours/1 hour/; s/ 1 hours/ 1 hour/;
  s/min,/minutes,/; s/ 0 minutes,/ less than a minute,/; s/ 1 minutes/ 1 minute/;
  s/  / /; s/, *[[:digit:]]* users?.*//')
fi

echo "$UP"