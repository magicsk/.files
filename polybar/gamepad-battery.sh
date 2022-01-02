#!/bin/sh

GP1=$(upower --show-info /org/freedesktop/UPower/devices/gaming_input_dev_9C_AA_1B_8A_07_B2 | grep percentage | tr -d -c "[:digit:]")

GP2=$(upower --show-info /org/freedesktop/UPower/devices/gaming_input_dev_C8_3F_26_B8_EE_BD | grep percentage | tr -d -c "[:digit:]")

PATH1=$(upower --show-info /org/freedesktop/UPower/devices/gaming_input_dev_9C_AA_1B_8A_07_B2 | grep native-path | cut -d"/"  -f3)

PATH2=$(upower --show-info /org/freedesktop/UPower/devices/gaming_input_dev_C8_3F_26_B8_EE_BD | grep native-path | cut -d"/"  -f3)

OUTPUT=""

if [ "$PATH1" = "bluez" ]
then
	OUTPUT="$OUTPUT   $GP1%"
fi

if [ "$PATH2" = "bluez" ]
then
	if [ "$OUTPUT" = "" ]
	then
		OUTPUT="$OUTPUT   $GP2%"
	else
		OUTPUT="$OUTPUT       $GP2%"
	fi
fi

echo $OUTPUT
