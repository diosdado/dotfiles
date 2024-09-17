#!/bin/bash


window=$(echo $(yabai -m query --windows) | jq '.[] | select(."has-focus" == true)')

window_id=$(echo $window | jq '.id')
window_display=$(echo $window | jq '.display')

if [ "$window_display" -eq "1" ]; then
    display_number="2"
else
    display_number="1"
fi

yabai -m window --display $display_number
yabai -m window --focus $window_id

