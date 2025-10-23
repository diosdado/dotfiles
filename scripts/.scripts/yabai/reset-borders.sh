#!/bin/bash

# start helper app to show borders around focused window
# https://github.com/FelixKratz/JankyBorders

. ~/.scripts/.conf


/opt/homebrew/bin/borders       \
style=round                     \
active_color=$border_active     \
inactive_color=$border_inactive \
width=10.0                      \
hidpi=on                        \
blacklist="Stickies,remote-viewer,Free\ Ruler,wine64\-preloader,steamwebhelper.exe,iPhone\ Mirroring"




# shift
# /opt/homebrew/bin/borders active_color=0xFFFFEC00

# hyper
# /opt/homebrew/bin/borders active_color=0xFF4A90E2
