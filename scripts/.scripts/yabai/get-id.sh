#!/bin/bash

# get the id or yabai object of an specific app

while getopts "a:i" flag; do
    case $flag in
        a) app=${OPTARG};;
        i) return_id=true;;
    esac
done


windows=$(yabai -m query --windows)

if [[ -n $app ]]; then
    window=$(echo $windows | jq ".[] | select(.\"app\" | test(\".?$app\"))")
else
    window=$(echo $windows | jq ".[] | select(.\"has-focus\" == true)")
fi


if [[ -n $return_id ]]; then
    echo $(echo $window | jq '.id')
else
    echo $window
fi




