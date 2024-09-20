#!/bin/bash

killall AMPDevicesAgent 2>/dev/null
killall AMPLibraryAgent 2>/dev/null

~/.scripts/notification.sh -m "Music Library Agents were closed to allow ejection of external volumes" -t "Library Agents"


