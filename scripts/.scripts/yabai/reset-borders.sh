#!/bin/bash

# start helper app to show borders around focused window
# https://github.com/FelixKratz/JankyBorders

/opt/homebrew/bin/borders   \
style=round                 \
active_color=0xff00ff00     \
inactive_color=0x00ffffff   \
width=8.0                   \
hidpi=on                    \
blacklist="Stickies,remote-viewer,Free\ Ruler,wine64\-preloader,steamwebhelper.exe,iPhone\ Mirroring"




# shift
# /opt/homebrew/bin/borders active_color=0xFFFFEC00

# hyper
# /opt/homebrew/bin/borders active_color=0xFF4A90E2
