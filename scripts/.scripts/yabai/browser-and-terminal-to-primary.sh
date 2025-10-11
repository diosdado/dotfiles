#!/bin/bash

# moves the browser and terminal to the main display

/opt/homebrew/bin/yabai -m rule --apply app="LibreWolf"         space=s_primary
/opt/homebrew/bin/yabai -m rule --apply app="Brave\ Browser"    space=s_primary
/opt/homebrew/bin/yabai -m rule --apply app="kitty"             space=s_primary

/opt/homebrew/bin/terminal-notifier -message "Browser and terminal to primary" -title "Yabai"
