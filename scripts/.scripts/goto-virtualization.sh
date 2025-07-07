#!/bin/bash



if ps aux | grep 'UTM' | grep -v grep; then
    open /Applications/UTM.app
    exit 0
fi


if ps aux | grep 'Screen Sharing' | grep -v grep; then
    open /System/Applications/Utilities/Screen\ Sharing.app
    exit 0
fi



open /Applications/Windows\ App.app

