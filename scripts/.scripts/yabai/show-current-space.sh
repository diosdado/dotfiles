#!/usr/bin/env bash

# launch a notification with the name of the label of the current focused layout

space_label=$(/opt/homebrew/bin/yabai -m query --spaces | /opt/homebrew/bin/jq '.[] | select(."has-focus" == true)' | jq '."label"')

/opt/homebrew/bin/terminal-notifier -message "$space_label" -title "Yabai"



