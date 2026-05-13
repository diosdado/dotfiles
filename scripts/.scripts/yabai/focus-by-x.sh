#!/bin/bash


visible_windows=$(/opt/homebrew/bin/yabai -m query --windows --space | /opt/homebrew/bin/jq '[ .[] | select(."is-visible" == true)]')
window_id=$(echo $visible_windows | /opt/homebrew/bin/jq -r "sort_by(.frame.x) | .[$1].id")

/opt/homebrew/bin/yabai -m window --focus $window_id
