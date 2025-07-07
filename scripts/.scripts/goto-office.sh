#!/bin/bash



if ps aux | grep 'Pages' | grep -v grep; then
    open /Applications/Pages.app
    exit 0
fi


if ps aux | grep 'Numbers' | grep -v grep; then
    open /Applications/Numbers.app
    exit 0
fi



if ps aux | grep 'ONLYOFFICE' | grep -v grep; then
    open /Applications/ONLYOFFICE.app
    exit 0
fi


if ps aux | grep 'Keynote' | grep -v grep; then
    open /Applications/Keynote.app
    exit 0
fi



