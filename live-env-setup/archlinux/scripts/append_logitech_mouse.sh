#!/bin/bash

file="/usr/share/libratbag/logitech-g102-g203.device"
new_value=";usb:046d:c09d"

# Use sed to append the new_value to the DeviceMatch line
sed -i "/^DeviceMatch/s/$/$new_value/" "$file"

echo "Appended $new_value to the DeviceMatch line in $file."
