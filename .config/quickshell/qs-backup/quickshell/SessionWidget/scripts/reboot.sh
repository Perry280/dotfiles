#!/usr/bin/env bash

if command -v hyprshutdown > /dev/null 2>&1; then
    hyprshutdown -t "Rebooting..." --post-cmd "systemctl reboot"
else
    systemctl reboot
fi
