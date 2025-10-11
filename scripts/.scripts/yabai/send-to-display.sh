#!/usr/bin/env bash

# move focused window to display in specific direction

while getopts "d:" flag; do
    case $flag in
        d) direction=${OPTARG};;
    esac
done

window_id=$(/opt/homebrew/bin/yabai -m query --windows | jq ".[] | select(.\"has-focus\" == true)" | jq '.id')
/opt/homebrew/bin/yabai -m window $window_id --display $direction

sleep .5

/opt/homebrew/bin/yabai -m window --focus $window_id







