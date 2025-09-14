#!/usr/bin/env bash

space_label=$(/opt/homebrew/bin/yabai -m query --spaces | /opt/homebrew/bin/jq '.[] | select(."has-focus" == true)' | jq '."label"')

/opt/homebrew/bin/terminal-notifier -message "$space_label" -title "Yabai"



# /opt/homebrew/bin/
