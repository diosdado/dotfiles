#!/bin/bash


while getopts "l:" flag; do
    case $flag in
        l) layer=${OPTARG};;
    esac
done

. ~/.scripts/.conf

case $layer in
    none)
        /opt/homebrew/bin/borders active_color=$border_inactive
        ;;

    default)
        /opt/homebrew/bin/borders active_color=$border_active
        ;;

    shift)
        /opt/homebrew/bin/borders active_color=$border_shift
        ;;

    yabai)
        /opt/homebrew/bin/borders active_color=$border_yabai
        ;;

    apps)
        /opt/homebrew/bin/borders active_color=$border_apps
        ;;
esac



