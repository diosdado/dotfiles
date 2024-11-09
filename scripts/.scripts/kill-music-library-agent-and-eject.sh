#!/bin/bash

# when the Apple Music Library is stored in an external volume, some agents prevent the ejection of said volume
# this script kills these agents and ejects the volume called 'Music'


killall AMPDevicesAgent 2>/dev/null
killall AMPLibraryAgent 2>/dev/null
diskutil unmount /Volumes/Music

~/.scripts/notification.sh -m "Ejecting external drive 'Music'" -t "Library Agents"


