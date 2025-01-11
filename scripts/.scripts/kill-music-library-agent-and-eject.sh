#!/bin/bash

# when the Apple Music Library is stored in an external volume, some agents prevent the ejection of said volume
# this script kills these agents and ejects the volume called 'Music'


killall Music 2>/dev/null
killall AMPDevicesAgent 2>/dev/null
killall AMPLibraryAgent 2>/dev/null
killall Finder 2>/dev/null
killall VLC 2>/dev/null

diskutil unmount /Volumes/Music
diskutil unmount /Volumes/Video
diskutil unmount /Volumes/Diosdado
diskutil unmount /Volumes/Diosdado\ WD
diskutil unmount /Volumes/Diosdado\ SG
diskutil unmount /Volumes/Diosdado\ SM

terminal-notifier -message "Ejecting external drive 'Music'" -title "Library Agents"

