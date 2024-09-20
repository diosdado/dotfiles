#!/bin/bash

# Custom tiling rules for Inkscape and Gimp

window=$(yabai -m query --windows --window)
window_id=$(echo $window | jq '.id')

is_gimp_main_conditions='
    (."app" | contains("GIMP")) and
    (
        (."title" | contains("– GIMP")) or
        (."title" | contains("GNU Image"))
    )
'
is_inkscape_main_conditions='
    (."app" | contains("Inkscape")) and
    (."title" | contains(" - Inkscape"))
'
is_inkscape_other_conditions='
    (."app" | contains("Inkscape")) and
    (."title" | contains(" - Inkscape") | not)
'
echo $window | jq -er "$is_gimp_main_conditions" && is_gimp_main="1"
echo $window | jq -er "$is_inkscape_main_conditions" && is_inkscape_main="1"
echo $window | jq -er "$is_inkscape_other_conditions" && is_inkscape_other="1"

# Only Inkscape and Gimp main windows should be tiled
if [ "$is_gimp_main" -eq "1" ] || [ "$is_inkscape_main" -eq "1" ]; then
    yabai -m window $window_id --toggle float
fi

# Inkscape dialogues are resized and centered on the screen to force their redrawing
if [ "$is_inkscape_other" -eq "1" ]; then
    yabai -m window $window_id --grid 7:5:1:1:3:5
fi

