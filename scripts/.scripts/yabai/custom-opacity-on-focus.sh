#!/bin/bash

# makes semi transparent just specific apps when not on focus

while getopts "r" flag
do
    case $flag in
        r) reset="1";; # resets the opacity of the windows to 1
    esac
done

. ~/.scripts/.conf

# sed -i 's/var=.*/var=new_value/' file_name

query='.[] | select(
	( ."app" == "Windows App" and ."title" == "" ) or
	( ."app" == "Windows App" and ."title" == "Devices" ) or
	( ."app" == "Jitsi Meet" and ."title" == "Screen Sharing Tracker" ) or
	( ."app" == "Finder" and ."title" != "Quick Look" ) or
    ."app" == "OBS Studio" or
    ."app" == "Preview" or
    ."app" == "Stickies" or
    ."app" == "System Settings" or
    ."app" == "Transmission" or
    ."app" == "Karabiner-Elements" or
    ."app" == "Karabiner-EventViewer" or
    ."app" == "Hex Fiend" or
    ."app" == "Font Book" or
    ."app" == "MAMP PRO"
) | .id'

focused=$(echo $(/opt/homebrew/bin/yabai -m query --windows) | /opt/homebrew/bin/jq '.[] | select(."has-focus" == true) | .id')
windows=$(/opt/homebrew/bin/yabai -m query --windows | /opt/homebrew/bin/jq "$query")

for win_id in $windows; do
    if [[ "$focused" -eq "$win_id" || "$reset" -eq "1" ]]; then
        /opt/homebrew/bin/yabai -m window "$win_id" --opacity 0.0
    else
        /opt/homebrew/bin/yabai -m window "$win_id" --opacity $focus_opacity
    fi
done


