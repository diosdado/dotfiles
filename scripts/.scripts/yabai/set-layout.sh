#!/usr/bin/env bash


while getopts "l:" flag; do
    case $flag in
        l) layout=${OPTARG};;
    esac
done



case $layout in
    default)
        # reset default layout
        #~/.scripts/yabai/set-labels.sh
        /opt/homebrew/bin/yabai -m rule --apply
        /opt/homebrew/bin/yabai -m space s_primary --layout bsp
        /opt/homebrew/bin/yabai -m space s_design --layout bsp
        /opt/homebrew/bin/yabai -m space s_preview --layout stack
        /opt/homebrew/bin/yabai -m space s_entertainment --layout stack
        /opt/homebrew/bin/yabai -m space s_conference --layout stack
        /opt/homebrew/bin/yabai -m space s_secondary --layout stack
        /opt/homebrew/bin/yabai -m space s_third --layout bsp
        /opt/homebrew/bin/yabai -m space s_email --layout bsp
        /opt/homebrew/bin/yabai -m space s_messages --layout bsp
        /opt/homebrew/bin/yabai -m space s_development --layout bsp
    ;;

    brave)
        /opt/homebrew/bin/yabai -m rule --apply app="^Brave\ Browser$"    space=s_primary
        sleep .1
        /opt/homebrew/bin/yabai -m rule --apply app="^LibreWolf$"         space=s_browser
    ;;

    normal)
        /opt/homebrew/bin/yabai -m rule --apply app="^kitty$"             space=s_primary
        sleep .1
        /opt/homebrew/bin/yabai -m rule --apply app="^Brave\ Browser$"    space=s_primary
        sleep .1
        /opt/homebrew/bin/yabai -m rule --apply app="^Inkscape$"          space=s_third
        sleep .1
        /opt/homebrew/bin/yabai -m rule --apply app="^GIMP$"              space=s_third
    ;;

    design)
        /opt/homebrew/bin/yabai -m rule --apply app="^kitty$"             space=s_third
        sleep .1
        /opt/homebrew/bin/yabai -m rule --apply app="^Brave\ Browser$"    space=s_third
        sleep .1
        /opt/homebrew/bin/yabai -m rule --apply app="^Inkscape$"          space=s_primary
        sleep .1
        /opt/homebrew/bin/yabai -m rule --apply app="^GIMP$"              space=s_primary
    ;;
esac

~/.scripts/yabai/reset-borders.sh



