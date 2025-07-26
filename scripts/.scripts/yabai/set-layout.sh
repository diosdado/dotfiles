#!/usr/bin/env bash


while getopts "l:" flag; do
    case $flag in
        l) layout=${OPTARG};;
    esac
done



case $layout in
    default)
        # reset default layout
        ~/.scripts/yabai/set-labels.sh
        yabai -m rule --apply
        yabai -m space s_primary --layout bsp
        yabai -m space s_design --layout bsp
        yabai -m space s_preview --layout stack
        yabai -m space s_entertainment --layout stack
        yabai -m space s_conference --layout stack
        yabai -m space s_secondary --layout stack
        yabai -m space s_third --layout bsp
        yabai -m space s_email --layout bsp
        yabai -m space s_messages --layout bsp
        yabai -m space s_development --layout bsp
    ;;

    normal)
        yabai -m rule --apply app="^kitty$"             space=s_primary
        sleep .1
        yabai -m rule --apply app="^Brave\ Browser$"    space=s_primary
        sleep .1
        yabai -m rule --apply app="^Inkscape$"          space=s_third
        sleep .1
        yabai -m rule --apply app="^GIMP$"              space=s_third
    ;;

    design)
        yabai -m rule --apply app="^kitty$"             space=s_third
        sleep .1
        yabai -m rule --apply app="^Brave\ Browser$"    space=s_third
        sleep .1
        yabai -m rule --apply app="^Inkscape$"          space=s_primary
        sleep .1
        yabai -m rule --apply app="^GIMP$"              space=s_primary
    ;;
esac

~/.scripts/yabai/reset-borders.sh



