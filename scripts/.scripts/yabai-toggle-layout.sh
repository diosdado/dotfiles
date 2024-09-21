#!/bin/bash

while getopts l:s: flag
do
    case "${flag}" in
        l) new_layout=${OPTARG};;
        s) space_index=${OPTARG};;
    esac
done


spaces=$(yabai -m query --spaces)
space_current=$(echo $spaces | jq '.[] | select(."has-focus" == true)')
layout_type=$(echo $space_current | jq -r '.type')



if [ -z "$new_layout" ]; then
    case "$layout_type" in
        bsp) new_layout=stack;;
        stack) new_layout=bsp;;
        float) new_layout=bsp;;
    esac
fi


if [ -z "$space_index" ]; then
    space="Current Space"
    yabai -m space --layout $new_layout
else
    space_data=$(echo $spaces | jq ".[] | select(.\"index\" == $space_index)")
    space_label=$(echo $space_data | jq -r '.label')
    space="Space: $space_index:$space_label"
    yabai -m space "$space_index" --layout "$new_layout"
fi

~/.scripts/notification.sh -m "$space\rLayout: $new_layout" -t "Yabai"



