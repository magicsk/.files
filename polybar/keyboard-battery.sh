#!/bin/sh

BATTERY=$(upower --show-info /org/freedesktop/UPower/devices/keyboard_hid_dco2co26odfo74ob0_battery | grep percentage | tr -d -c "[:digit:]")

PATH=$(upower --show-info /org/freedesktop/UPower/devices/keyboard_hid_dco2co26odfo74ob0_battery | grep native-path | cut -d":"  -f3)

if [ "$PATH" != "" ]
then
	echo "    $BATTERY%"
else
	echo ""
fi
