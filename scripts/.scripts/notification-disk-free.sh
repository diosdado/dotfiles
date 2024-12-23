#!/bin/bash

mac_hd_avail=$(gdf -H --output=avail / | tail -1)
mac_hd_size=$(gdf -H --output=size / | tail -1)
message_mac_hd="Macintosh HD: $mac_hd_avail / $mac_hd_size"

my_hd_avail=$(gdf -H --output=avail /Volumes/Diosdado/ | tail -1)
my_hd_size=$(gdf -H --output=size /Volumes/Diosdado/ | tail -1 | xargs)
message_my_hd="My HD: $my_hd_avail / $my_hd_size"

music_hd_avail=$(gdf -H --output=avail /Volumes/Music/ | tail -1)
music_hd_size=$(gdf -H --output=size /Volumes/Music/ | tail -1 | xargs)
message_music_hd="Music HD: $music_hd_avail / $music_hd_size"

message=$(
    echo "$message_mac_hd" ;
    test -n $my_hd_size && echo "$message_my_hd" ;
    test -n $music_hd_size && echo "$message_music_hd";
)







terminal-notifier -message "$message" -title "Space available"
