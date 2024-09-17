#!/bin/bash

killall AMPDevicesAgent 2>/dev/null
killall AMPLibraryAgent 2>/dev/null

osascript -e 'display notification "Music Library Agents were closed to allow eject external volumes" with title "Library Agents"'


