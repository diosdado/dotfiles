#!/bin/bash

# start helper app to show borders around focused window
# https://github.com/FelixKratz/JankyBorders

borders                     \
style=round                 \
active_color=0xff00ff00     \
inactive_color=0x00ffffff   \
width=8.0                   \
hidpi=on                    \
blacklist="Stickies,Free\ Ruler,wine64\-preloader,steamwebhelper.exe"

