#! /bin/bash
#

variable="$(last console | head -1 | awk '{print $3,$4,$5,$6}')"

echo "$variable"