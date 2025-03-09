#!/usr/bin/env bash

~/.scripts/yabai/rule-default.sh

# yabai -m rule --apply app="^kitty$"             space=s_main
yabai -m rule --apply app="^Floorp$"            space=s_tertiary
yabai -m rule --apply app="^Sandox\ Meet$"      space=s_secondary
yabai -m rule --apply app="^Microsoft\ Teams$"  space=s_secondary
yabai -m rule --apply app="^zoom.us$"           space=s_secondary
yabai -m rule --apply app="^WhatsApp$"          space=s_messages_2
yabai -m rule --apply app="‎WhatsApp"      space=s_messages_2
yabai -m rule --apply app="^Reminders$"         space=s_messages_2
yabai -m rule --apply app="^Stickies$"          space=s_messages_2
yabai -m rule --apply app="^Gmail$"             space=s_settings
yabai -m rule --apply app="^Mail$"              space=s_settings

yabai -m space --focus s_tertiary
yabai -m space --focus s_secondary
yabai -m space --focus s_main

open /Applications/kitty.app
