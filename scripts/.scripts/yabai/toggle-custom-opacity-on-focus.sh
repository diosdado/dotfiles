#!/bin/bash

# turns on and off the opacity on focus for specific apps
# the configuration of the opacity is defined in custom-opacity-on-focus.sh

config_file=~/.scripts/.conf
. $config_file

if [[ "$focus_opacity" == "$default_focus_opacity" ]]; then
    sed -i '' "s/^focus_opacity=.*/focus_opacity=0.0/" $config_file
    opacity_status="Off"
else
    sed -i '' "s/^focus_opacity=.*/focus_opacity=$default_focus_opacity/" $config_file
    opacity_status="On"
fi

~/.scripts/yabai/custom-opacity-on-focus.sh

/opt/homebrew/bin/terminal-notifier -message "Focus Opacity $opacity_status" -title "Yabai"

