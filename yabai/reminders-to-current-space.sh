#!/bin/bash

# Toggles the space of the Reminders app between its default space and the current space

# Open the Reminders app if it's not already open
ps aux | grep -v grep | grep 'Reminders.app/Contents/MacOS/' || open /System/Applications/Reminders.app

window=$(echo $(yabai -m query --windows) | jq '.[] | select(.app == "Reminders")')
spaces=$(echo $(yabai -m query --spaces))

window_id=$(echo $window | jq '.id')
window_space=$(echo $window | jq '.space')
space_tasks=$(echo $spaces | jq '.[] | select(."label" == "s_tasks") | .index')
space_current=$(echo $spaces | jq '.[] | select(."has-focus" == true) | .index')

if [ "$window_space" -eq "$space_current" ]; then
    echo 'equal'
    yabai -m window $window_id --space $space_tasks
else
    echo 'unequal'
    yabai -m window $window_id --space $space_current
fi
