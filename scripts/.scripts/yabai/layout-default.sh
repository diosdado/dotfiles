#!/usr/bin/env bash

# reset default layout
~/.scripts/yabai/set-labels.sh

yabai -m rule --apply
yabai -m space s_primary --layout bsp
yabai -m space s_design --layout bsp
yabai -m space s_entertainment --layout stack
yabai -m space s_conference --layout stack
yabai -m space s_secondary --layout stack
yabai -m space s_third --layout bsp
yabai -m space s_email --layout bsp
yabai -m space s_messages --layout bsp
yabai -m space s_development --layout bsp

~/.scripts/yabai/reset-borders.sh

