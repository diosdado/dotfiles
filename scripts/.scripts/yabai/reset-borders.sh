#!/bin/bash
# start helper app to show borders around focused window
# https://github.com/FelixKratz/JankyBorders

. ~/.scripts/.conf

killall borders

options=(
    style=round
    active_color=$border_active
    inactive_color=$border_inactive
    width=10.0
    blacklist="Free\ Ruler,Stickies,remote-viewer,wine64\-preloader,steamwebhelper.exe,iPhone\ Mirroring"
)

echo "${options[@]}"

/opt/homebrew/bin/borders "${options[@]}" &

# shift
# /opt/homebrew/bin/borders active_color=0xFFFFEC00

# hyper
# /opt/homebrew/bin/borders active_color=0xFF4A90E2
