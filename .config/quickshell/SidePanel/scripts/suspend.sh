#!/usr/bin/env bash

if command -v hyprshutdown > /dev/null 2>&1; then
    hyprshutdown -t "Suspending..." --post-cmd "systemctl suspend"
else
    systemctl suspend
fi
