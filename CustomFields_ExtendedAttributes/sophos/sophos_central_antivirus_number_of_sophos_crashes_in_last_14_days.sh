#!/bin/bash

# crashes or kernel panics

PanicLogCount=$(find /Library/Logs/DiagnosticReports -Btime -14 -name 'Sophos*.crash' | awk 'END{print NR}')

echo "$PanicLogCount"

exit 0