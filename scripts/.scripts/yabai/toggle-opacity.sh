#!/bin/bash

# toggles the opacity of the current window

window=$(echo $(yabai -m query --windows) | jq '.[] | select(."has-focus" == true)')

window_id=$(echo $window | jq '.id')
window_opacity=$(echo $window | jq '.opacity')

yabai -m window "$window_id" --opacity 0.0

if [[ "1.0000" > "$window_opacity" ]]; then
    yabai -m window "$window_id" --opacity 0.0
else
    yabai -m window "$window_id" --opacity 0.6
fi


