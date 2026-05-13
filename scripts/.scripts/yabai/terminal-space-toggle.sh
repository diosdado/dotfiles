#!/bin/bash

# moves the browser and terminal to the main display

while getopts "s:" flag; do
    case $flag in
        s) space=${OPTARG};;
    esac
done

delays=.3
spaces_json=$(/opt/homebrew/bin/yabai -m query --spaces)
s_primary=$(echo $spaces_json | /opt/homebrew/bin/jq '.[] | select(."label" == "s_primary") | .index')
kitty_space=$(/opt/homebrew/bin/yabai -m query --windows | /opt/homebrew/bin/jq '[ .[] | select( .app | contains("kitty")) ] | first | .space')


sleep $delays


if [[ "$kitty_space" -eq "$s_primary" ]]; then
    /opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=$space
    sleep $delays
    /opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=$space
else
    /opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=s_primary
    sleep $delays
    /opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=s_primary
fi

sleep $delays

open -a 'kitty'







