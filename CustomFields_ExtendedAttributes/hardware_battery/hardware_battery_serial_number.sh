#!/bin/sh

echo "$(ioreg -r -c "AppleSmartBattery" | grep "BatterySerialNumber" | awk '{print $3}' | sed s/\"//g)"