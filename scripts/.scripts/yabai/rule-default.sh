#!/usr/bin/env bash

yabai -m rule --apply

yabai -m space s_main --layout bsp
yabai -m space s_design --layout bsp
yabai -m space s_office --layout stack
yabai -m space s_extras --layout bsp
yabai -m space s_settings --layout bsp
yabai -m space s_entertainment --layout bsp

yabai -m space s_secondary --layout stack
yabai -m space s_meet --layout stack
yabai -m space s_email --layout bsp
yabai -m space s_messages --layout bsp

yabai -m space s_tertiary --layout stack
yabai -m space s_messages_2 --layout bsp




