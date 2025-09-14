#!/bin/bash

# changes the tiling window layout and restarts yabai

while getopts "l:" flag
do
    case $flag in
        l) new_yabai_layout=${OPTARG};;
    esac
done

config_file=~/.scripts/.conf
. $config_file

sed -i '' "s/^yabai_layout=.*/yabai_layout=$new_yabai_layout/" $config_file


~/.scripts/yabai/set-rules.sh -a
sleep .2
~/.scripts/yabai/set-rules.sh -a

