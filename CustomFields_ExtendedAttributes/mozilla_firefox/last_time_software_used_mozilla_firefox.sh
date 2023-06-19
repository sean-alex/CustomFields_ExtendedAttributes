#!/bin/bash

# directory or file name that we want to know when it was last used
mdlsDirectoryOrFileName="/Applications/Firefox.app"

result=$( mdls "${mdlsDirectoryOrFileName}" -name kMDItemLastUsedDate | awk '{print $3,$4}' )

echo "${result}"

exit 0