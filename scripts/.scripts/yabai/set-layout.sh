#!/usr/bin/env bash



num_displays=$(yabai -m query --spaces | jq length)


case $num_displays in
1)
    yabai -m space s_main --layout stack
    yabai -m space s_design --layout stack
;;

2)
;;

3)
    yabai -m rule --apply app="^kitty$"             space=s_main
    yabai -m rule --apply app="^Floorp$"            space=s_secondary
    yabai -m rule --apply app="^WhatsApp$"          space=s_messages_2
    yabai -m rule --apply app="‎WhatsApp"      space=s_messages_2
    yabai -m rule --apply app="^Reminders$"         space=s_messages_2
    yabai -m rule --apply app="^Stickies$"          space=s_messages_2
    yabai -m rule --apply app="^Gmail$"             space=s_settings
    yabai -m rule --apply app="^Mail$"              space=s_settings
    yabai -m space --focus s_messages_2
    yabai -m space --focus s_secondary
    yabai -m space --focus s_main
;;
esac


open /Applications/kitty.app



