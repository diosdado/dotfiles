#!/bin/bash

# open an app if it's closed, hide it if is visible, and show it if it's open and hidden


while getopts "n:p:" flag; do
    case $flag in
        n) name=${OPTARG};;
        p) path=${OPTARG};;
    esac
done


# get window info
window=$(~/.scripts/yabai/get-id.sh -a "$name")
is_visible=$(echo $window | jq ".\"is-visible\"")
has_focus=$(echo $window | jq ".\"has-focus\"")
id=$(echo $window | jq '."id"')



# if info is empty, launch the app
if [[ -z $(~/.scripts/yabai/get-id.sh -a $name -i) ]]; then
    open $path
    exit 0
fi


# if info exists, focus it
yabai -m window --focus "$id"


# hide the app if it was already open, visible, and has focus
if [[ "$has_focus" == "true" ]]; then
    skhd -k "cmd -h"
fi




