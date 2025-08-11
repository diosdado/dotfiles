#!/usr/bin/env bash

while getopts "d:" flag; do
    case $flag in
        d) direction=${OPTARG};;
    esac
done

window_id=$(/opt/homebrew/bin/yabai -m query --windows | jq ".[] | select(.\"has-focus\" == true)" | jq '.id')
/opt/homebrew/bin/yabai -m window $window_id --display $direction
/opt/homebrew/bin/yabai -m window --focus $window_id






