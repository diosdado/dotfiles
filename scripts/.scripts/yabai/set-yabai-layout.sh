#!/bin/bash

# changes the layout in the .config file, applies it with the
# set-rules.sh script and restarts yabai

while getopts "l:c" flag
do
    case $flag in
        l) new_yabai_layout=${OPTARG};;
        c) toggle_conference_layout=1;;
    esac
done


# load configuration file
config_file=~/.scripts/.conf
. $config_file


# update the yabai_layout value in the config file
if [[ -n $new_yabai_layout ]]; then
    sed -i '' "s/^yabai_layout=.*/yabai_layout=$new_yabai_layout/" $config_file
fi


# update the conference_layout value in the config file
if [[ -n $toggle_conference_layout ]]; then
    if [[ $conference_layout = "default" ]]; then
        new_conference_layout="primary"
    else
        new_conference_layout="default"
    fi
    sed -i '' "s/^conference_layout=.*/conference_layout=$new_conference_layout/" $config_file
fi


# force the setting of the rules of yabai two times because yabai fails sometimes
~/.scripts/yabai/set-rules.sh -a
sleep .2
~/.scripts/yabai/set-rules.sh -a

. $config_file

/opt/homebrew/bin/terminal-notifier -message "L:$yabai_layout, C: $conference_layout" -title "Yabai"

