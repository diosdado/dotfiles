#!/usr/bin/env bash

while getopts "d:" flag; do
    case $flag in
        d) direction=${OPTARG};;
    esac
done

window_id=$(yabai -m query --windows | jq ".[] | select(.\"has-focus\" == true)" | jq '.id')
yabai -m window $window_id --display $direction
yabai -m window --focus $window_id






