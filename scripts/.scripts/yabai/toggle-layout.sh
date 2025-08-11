#!/bin/bash

# cycles the layout of the current space
# l: sets the layout to the one specifided
# s: instead of the current space the layout is applied to the space with the specified index

while getopts l:s: flag
do
    case "${flag}" in
        l) new_layout=${OPTARG};;   # layout name
        s) space_index=${OPTARG};;  # space index
    esac
done


spaces=$(/opt/homebrew/bin/yabai -m query --spaces)
space_current=$(echo $spaces | /opt/homebrew/bin/jq '.[] | select(."has-focus" == true)')
layout_type=$(echo $space_current | /opt/homebrew/bin/jq -r '.type')



if [ -z "$new_layout" ]; then
    case "$layout_type" in
        bsp) new_layout=stack;;
        stack) new_layout=bsp;;
    esac
fi


if [ -z "$space_index" ]; then
    space="Current Space"
    /opt/homebrew/bin/yabai -m space --layout $new_layout
else
    space_data=$(echo $spaces | /opt/homebrew/bin/jq ".[] | select(.\"index\" == $space_index)")
    space_label=$(echo $space_data | /opt/homebrew/bin/jq -r '.label')
    space="Space: $space_index:$space_label"
    /opt/homebrew/bin/yabai -m space "$space_index" --layout "$new_layout"
fi


/opt/homebrew/bin/terminal-notifier -message "$space\rLayout: $new_layout" -title "/opt/homebrew/bin/yabai"


