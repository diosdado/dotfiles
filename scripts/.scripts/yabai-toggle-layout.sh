#!/bin/bash

while getopts l: flag
do
    case "${flag}" in
        l) new_layout=${OPTARG};;
    esac
done

spaces=$(yabai -m query --spaces)
space_current=$(echo $spaces | jq '.[] | select(."has-focus" == true)')
layout_type=$(echo $space_current | jq -r '.type')
space_id=$(echo $space_current | jq -r '.id')

if [ -z "$new_layout" ]; then
    case "$layout_type" in
        bsp) new_layout=stack;;
        stack) new_layout=bsp;;
        # float) new_layout=bsp;;
    esac
fi

yabai -m space --layout $new_layout ; ~/.scripts/notification.sh -m "$new_layout" -t "Yabai"

