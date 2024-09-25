#!/bin/bash

killall AMPDevicesAgent 2>/dev/null
killall AMPLibraryAgent 2>/dev/null
diskutil unmount /Volumes/Music

~/.scripts/notification.sh -m "Ejecting external drive 'Music'" -t "Library Agents"


