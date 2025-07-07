#!/usr/bin/env bash



yabai -m space s_development --layout bsp
yabai -m rule --apply app="^Floorp$"      space=s_development
yabai -m rule --apply app="^kitty$"       space=s_development

kitty_window_id=$(~/.scripts/yabai/get-id.sh -a kitty -i)
yabai -m window $kitty_window_id --swap first
