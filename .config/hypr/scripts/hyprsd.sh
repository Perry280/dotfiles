#!/usr/bin/env bash

if command -v hyprshutdown > /dev/null 2>&1; then
    alias hlsd="hyprshutdown -t 'Shutting down...' --post-cmd 'systemctl poweroff'"
    alias hlrb="hyprshutdown -t 'Restarting...' --post-cmd 'systemctl reboot'"
fi
