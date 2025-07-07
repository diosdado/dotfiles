#!/bin/bash






if ps aux | grep 'draw\.io' | grep -v grep; then
    open /Applications/draw.io.app
    exit 0
fi


if ps aux | grep 'Blender' | grep -v grep; then
    open /Applications/Blender.app
    exit 0
fi


if ps aux | grep 'GIMP' | grep -v grep; then
    open /Applications/GIMP.app
    exit 0
fi


if ps aux | grep 'Inkscape' | grep -v grep; then
    open /Applications/Inkscape.app
    exit 0
fi





