#!/usr/bin/env bash

if [ "$(cat /sys/class/thermal/thermal_zone0/type)" == "x86_pkg_temp" ]; then
    cat /sys/class/thermal/thermal_zone0/temp
else
    cat /sys/class/thermal/thermal_zone1/temp
fi
