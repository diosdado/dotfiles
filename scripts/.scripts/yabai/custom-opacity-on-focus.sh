#!/bin/bash

while getopts "r" flag
do
    case $flag in
        r) reset="1";; # resets the opacity of the windows to 1
    esac
done

. ~/.scripts/.conf

# sed -i 's/var=.*/var=new_value/' file_name

query='.[] | select(
    ."app" == "Stickies" or
    ."app" == "System Settings" or
    ."app" == "Finder"
) | .id'
# ."app" == "WhatsApp" or
# ."app" == "‎WhatsApp"

focused=$(echo $(yabai -m query --windows) | jq '.[] | select(."has-focus" == true) | .id')
windows=$(yabai -m query --windows | jq "$query")

for win_id in $windows; do
    if [[ "$focused" -eq "$win_id" || "$reset" -eq "1" ]]; then
        yabai -m window "$win_id" --opacity 0.0
    else
        yabai -m window "$win_id" --opacity $focus_opacity
    fi
done

# (( $( echo "9.8 < 1" | bc -l ) ))






