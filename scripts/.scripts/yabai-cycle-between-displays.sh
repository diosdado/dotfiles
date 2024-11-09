#!/bin/bash


display=$(echo $(yabai -m query --displays) | jq '.[] | select(."has-focus" == true)')
display_id=$(echo $display | jq '.id')

if [ "$display_id" -eq "1" ]; then
    display_number="2"
else
    display_number="1"
fi

yabai -m display --focus $display_number


