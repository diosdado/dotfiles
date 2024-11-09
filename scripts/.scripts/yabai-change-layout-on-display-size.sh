#!/bin/bash

# Automatic layout for s_main space based on display size

spaces=$(yabai -m query --spaces)
displays=$(yabai -m query --displays)
space_main=$(echo $spaces | jq '.[] | select(."label" == "s_main")')
space_main_index=$(echo $space_main | jq -r '.index')
display_main_id=$(echo $space_main | jq -r '.display')
display_main=$(echo $displays | jq -r ".[] | select(.\"id\" == $display_main_id)")
display_main_width=$(echo $display_main | jq -r '.frame.w')
width_integer=$(printf "%1.f" $display_main_width)



if [ $(printf "%1.f" $width_integer) -gt 1800 ]; then
    ~/.scripts/yabai-toggle-layout.sh -s "$space_main_index" -l "bsp"
else
    ~/.scripts/yabai-toggle-layout.sh -s "$space_main_index" -l "stack"
fi

