#!/bin/bash

if [ $(whoami) != 'root' ]; then 
	echo 'Please run as root'
	exit 1
fi

echo 'ACTION=="remove", GOTO="sensor_end"
 
SUBSYSTEM=="iio", KERNEL=="iio*", SUBSYSTEMS=="platform", 
ATTRS{modalias}=="platform:cros-ec-accel", 
ENV{ACCEL_MOUNT_MATRIX}="0, 1, 0; -1, 0, 0; 0, 0, -1", 
GOTO="sensor_end"

LABEL="sensor_end"' > /etc/udev/rules.d/61-cros-ec-accel.rules

mkdir -p /etc/libinput
echo '[Touchpad pressure override]
MatchUdevType=touchpad
MatchName=Google Inc. Hammer
AttrPressureRange=20:10' > /etc/libinput/local-overrides.quirks

apk add keyd git py3-libfdt
git clone https://github.com/WeirdTreeThing/cros-keyboard-map /tmp/
/tmp/cros-keyboard-map/install.sh
rm -rf /tmp/cros-keyboard-map/

echo "Google Krane customization installed"
exit 0