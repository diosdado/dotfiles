#!/bin/bash

window=$(echo $(yabai -m query --windows) | jq '.[] | select(."has-focus" == true)')
window_id=$(echo $window | jq '.id')

is_gimp_main='(."app" | contains("GIMP")) and ((."title" | contains("– GIMP")) or (."title" | contains("GNU Image")))'
is_inkscape_main='(."app" | contains("Inkscape")) and (."title" | contains(" - Inkscape"))'

echo $window | jq -er $is_gimp_main && yabai -m window $window_id --toggle float
echo $window | jq -er $is_inkscape_main && yabai -m window $window_id --toggle float

script_alert=$(echo 'display notification "Window Id: '$window_id'" with title "Yabai"')
osascript -e "$script_alert"

