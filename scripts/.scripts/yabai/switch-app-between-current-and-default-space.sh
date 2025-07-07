#!/bin/bash

OIFS="$IFS"
IFS=$'\n'

while getopts "a:l:d:" flag; do
    case $flag in
        a) app_name=${OPTARG};;
        l) app_location=${OPTARG};;
        d) default_space=${OPTARG};;
    esac
done


# Open the app if it's not already open
ps aux | grep -v grep | grep "$app_name.app/Contents/MacOS/" || open "$app_location/$app_name.app"

windows=$(yabai -m query --windows)

window_ids=($(echo $windows | jq ".[] | select(.app == \"$app_name\")" | jq ".id"))
window_space=$(echo $windows | jq ".[] | select(.id == \"${window_ids[0]}\")"  | jq '.space')
echo $window_space
exit
space_current=$(yabai -m query --spaces | jq ".[] | select(.\"label\" == \"$default_space\") | .index")

if [ "$window_space" -eq "$space_current" ]; then
    next_space=$default_space
else
    next_space=$space_current
fi

echo $next_space

for win_id in $windows; do
    yabai -m window "$win_id" --space $next_space
done


IFS="$OIFS"
