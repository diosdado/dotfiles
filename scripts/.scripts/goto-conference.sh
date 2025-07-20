#!/bin/bash



if ps aux | grep 'Jitsi Meet' | grep -v grep; then
    open /Applications/Jitsi\ Meet.app
    exit 0
fi

if ps aux | grep 'Teams.app' | grep -v grep; then
    open ~/Applications/Teams.app
    exit 0
fi

if ps aux | grep 'Zoom.app' | grep -v grep; then
    open ~/Applications/Brave\ Browser\ Apps.localized/Zoom.app
    exit 0
fi

open /Applications/Jitsi\ Meet.app
