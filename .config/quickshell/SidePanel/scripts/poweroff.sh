#!/usr/bin/env bash

if command -v hyprshutdown > /dev/null 2>&1; then
    hyprshutdown -t "Shutting down..." --post-cmd "systemctl poweroff"
else
    systemctl poweroff
fi
