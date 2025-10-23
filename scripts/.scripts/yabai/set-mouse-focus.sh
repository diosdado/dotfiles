#!/bin/bash

config_file=~/.scripts/.conf
. $config_file

if [[ $focus_follows_mouse = "no" ]]; then
    new_focus_follows_mouse="yes"
else
    new_focus_follows_mouse="no"
fi


sed -i '' "s/^focus_follows_mouse=.*/focus_follows_mouse=$new_focus_follows_mouse/" $config_file


~/.scripts/yabai/reset-mouse-focus.sh

sleep .2

. $config_file

/opt/homebrew/bin/terminal-notifier -message "Focus follows mouse: $focus_follows_mouse" -title "Yabai"
