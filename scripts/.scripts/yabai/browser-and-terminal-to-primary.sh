#!/bin/bash

# moves the browser and terminal to the main display

spaces_json=$(/opt/homebrew/bin/yabai -m query --spaces)
s_third=$(echo $spaces_json | /opt/homebrew/bin/jq '.[] | select(."label" == "s_third") | .index')
s_primary=$(echo $spaces_json | /opt/homebrew/bin/jq '.[] | select(."label" == "s_primary") | .index')
kitty_space=$(/opt/homebrew/bin/yabai -m query --windows | /opt/homebrew/bin/jq '[ .[] | select( .app | contains("kitty")) ] | first | .space')


sleep .3


if [[ "$kitty_space" -eq "$s_primary" ]]; then
    /opt/homebrew/bin/yabai -m rule --apply app="LibreWolf"         space=s_third
    /opt/homebrew/bin/yabai -m rule --apply app="Brave\ Browser"    space=s_third
    /opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=s_third
    sleep .3
    /opt/homebrew/bin/yabai -m rule --apply app="LibreWolf"         space=s_third
    /opt/homebrew/bin/yabai -m rule --apply app="Brave\ Browser"    space=s_third
    /opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=s_third
    /opt/homebrew/bin/terminal-notifier -message "Browser and terminal to third" -title "Yabai"
else
    /opt/homebrew/bin/yabai -m rule --apply app="LibreWolf"         space=s_primary
    /opt/homebrew/bin/yabai -m rule --apply app="Brave\ Browser"    space=s_primary
    /opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=s_primary
    sleep .3
    /opt/homebrew/bin/yabai -m rule --apply app="LibreWolf"         space=s_primary
    /opt/homebrew/bin/yabai -m rule --apply app="Brave\ Browser"    space=s_primary
    /opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=s_primary
    /opt/homebrew/bin/terminal-notifier -message "Browser and terminal to primary" -title "Yabai"
fi









