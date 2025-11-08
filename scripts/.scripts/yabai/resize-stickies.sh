#!/bin/bash

# rearrange all Stickies windows

space_name="s_reminders"
display_index=$(/opt/homebrew/bin/yabai -m query --spaces | /opt/homebrew/bin/jq ".[] | select(.label == \"$space_name\") | .display")
display_frame=$(/opt/homebrew/bin/yabai -m query --displays | /opt/homebrew/bin/jq ".[] | select(.index == $display_index) | .frame")
display_left=$(echo $display_frame | /opt/homebrew/bin/jq ".x" | cut -d'.' -f1)
display_top=$(echo $display_frame | /opt/homebrew/bin/jq ".y" | cut -d'.' -f1)
position_left=$(( $display_left + 40 ))
position_top=$(( $display_top + 60 ))
position_increment=10
window_width=200
query='.[] | select( ."app" == "Stickies") | .id'
windows=$(/opt/homebrew/bin/yabai -m query --windows | /opt/homebrew/bin/jq "$query")

/opt/homebrew/bin/yabai -m rule --apply app="^Stickies$" space=$space_name

for win_id in $windows; do
    /opt/homebrew/bin/yabai -m window "$win_id" --resize abs:$window_width:$window_width
    /opt/homebrew/bin/yabai -m window "$win_id" --move abs:$position_left:$position_top
    position_left=$(( $position_left + $position_increment + $window_width ))
done





