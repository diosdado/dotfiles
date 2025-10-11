#!/bin/bash

mac_hd_avail=$(/opt/homebrew/bin/gdf -H --output=avail / | tail -1 | xargs)
mac_hd_size=$(/opt/homebrew/bin/gdf -H --output=size / | tail -1 | xargs)

my_hd_avail=$(/opt/homebrew/bin/gdf -H --output=avail /Volumes/Diosdado/ | tail -1 | xargs)
my_hd_size=$(/opt/homebrew/bin/gdf -H --output=size /Volumes/Diosdado/ | tail -1 | xargs)

music_hd_avail=$(/opt/homebrew/bin/gdf -H --output=avail /Volumes/Music/ | tail -1 | xargs)
music_hd_size=$(/opt/homebrew/bin/gdf -H --output=size /Volumes/Music/ | tail -1 | xargs)

message=$(
    echo "Macintosh HD: ${mac_hd_avail}  /  ${mac_hd_size}" ;
    echo '' ;
    echo "Diosdado HD: ${my_hd_avail}  /  ${my_hd_size}" ;
)


OIFS="$IFS" ; IFS=$'\n'
osascript -e "tell app \"System Events\" to display alert \"Free space\" message \"$message\""
IFS="$OIFS"



