#!/bin/bash

config_file=~/.scripts/.conf
. $config_file

if [[ "$focus_opacity" == "$default_focus_opacity" ]]; then
    sed -i '' "s/^focus_opacity=.*/focus_opacity=0.0/" $config_file
else
    sed -i '' "s/^focus_opacity=.*/focus_opacity=$default_focus_opacity/" $config_file
fi

~/.scripts/yabai/custom-opacity-on-focus.sh


