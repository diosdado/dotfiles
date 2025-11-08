#!/bin/bash


while getopts d: flag
do
    case "${flag}" in
        d) direction=${OPTARG};;
    esac
done

window_id=$(/opt/homebrew/bin/yabai -m query --windows --window | /opt/homebrew/bin/jq '.id')

sleep .3

/opt/homebrew/bin/yabai -m window --display $direction
/opt/homebrew/bin/yabai -m display --focus $direction



sleep .3

/opt/homebrew/bin/yabai -m window --focus "$window_id"


