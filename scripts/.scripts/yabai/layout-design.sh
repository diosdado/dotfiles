#!/usr/bin/env bash



yabai -m rule --apply app="^kitty$"             space=s_third
sleep .1
yabai -m rule --apply app="^Brave\ Browser$"    space=s_third
sleep .1
yabai -m rule --apply app="^Inkscape$"          space=s_primary
sleep .1
yabai -m rule --apply app="^GIMP$"              space=s_primary

