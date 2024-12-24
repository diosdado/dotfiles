#!/bin/bash

while getopts "r" flag
do
    case $flag in
        r) reset="1";; # resets the opacity of the windows to 1
    esac
done

query='.[] | select(
    ."app" == "Stickies" or
    ."app" == "Finder" or
    ."app" == "Instagram" or
    ."app" == "System Settings" or
    ."app" == "whatsapp.com"
) | .id'

focused=$(echo $(yabai -m query --windows) | jq '.[] | select(."has-focus" == true) | .id')
windows=$(yabai -m query --windows | jq "$query")

for win_id in $windows; do
    if [[ "$focused" -eq "$win_id" || "$reset" -eq "1" ]]; then
        yabai -m window "$win_id" --opacity 0.0
    else
        yabai -m window "$win_id" --opacity 0.5
    fi
done

# (( $( echo "9.8 < 1" | bc -l ) ))






