#!/bin/bash

# Custom tiling rules for Inkscape and Gimp

while getopts "a" flag
do
    case $flag in
        a) checkall="1";; # reeavaluates all gimp and inkscape windows, not just the current
    esac
done


if [[ "$checkall" -eq "1" ]]; then
    windows=$(yabai -m query --windows | jq '.[] | select(.app == "Inkscape" or .app == "GIMP") | .id')
else
    windows=$(yabai -m query --windows --window | jq '.id')
fi


for window_id in $windows; do
    window=$(yabai -m query --windows --window $window_id)
    floating=$(echo $window | jq 'if ."is-floating" then 1 else 0 end')
    case $(~/.scripts/yabai/evaluate-window.sh -w $window_id) in
        is_gimp_main|is_inkscape_main)
            if [[ "$floating" -eq "1" ]]; then
                yabai -m window $window_id --toggle float
            fi
            ;;
        is_inkscape_other)
            # yabai -m window $window_id --grid 7:5:1:1:3:5
            ;;
    esac
done






