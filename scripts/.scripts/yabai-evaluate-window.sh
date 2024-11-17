#!/bin/bash


# get parameters from flag
while getopts w: flag
do
    case "${flag}" in
        w) window_id=${OPTARG};; # window properties for window (yabai object)
    esac
done


# window properties
window=$(yabai -m query --windows --window $window_id)


# conditions
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

# evaluate the window
(echo $window | jq -er "$is_gimp_main_conditions")>/dev/null        && identifier="is_gimp_main"
(echo $window | jq -er "$is_inkscape_main_conditions")>/dev/null    && identifier="is_inkscape_main"
(echo $window | jq -er "$is_inkscape_other_conditions")>/dev/null   && identifier="is_inkscape_other"


# return the identifier
echo $identifier




