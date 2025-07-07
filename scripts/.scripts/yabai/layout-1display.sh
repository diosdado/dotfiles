#!/usr/bin/env bash

# reset default layout
~/.scripts/yabai/set-labels.sh

yabai -m rule --apply
yabai -m space s_primary --layout bsp
yabai -m space s_design --layout bsp
yabai -m space s_entertainment --layout bsp
yabai -m space s_secondary --layout stack
yabai -m space s_office --layout stack
yabai -m space s_email --layout bsp
yabai -m space s_messages --layout bsp
yabai -m space s_development --layout stack




