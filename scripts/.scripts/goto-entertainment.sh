#!/bin/bash


if ps aux | grep 'Crunchyroll' | grep -v grep; then
    open ~/Applications/Brave\ Browser\ Apps.localized/Crunchyroll\ -\ Watch\ Popular\ Anime.app
    exit 0
fi

if ps aux | grep 'Music.app' | grep -v grep; then
    open /System/Applications/Music.app
    exit 0
fi

if ps aux | grep 'Spotify' | grep -v grep; then
    open ~/Applications/Brave\ Browser\ Apps.localized/Spotify.app
    exit 0
fi

if ps aux | grep 'Disney' | grep -v grep; then
    open ~/Applications/Brave\ Browser\ Apps.localized/Disney+.app
    exit 0
fi

if ps aux | grep 'Prime' | grep -v grep; then
    open ~/Applications/Brave\ Browser\ Apps.localized/Prime\ Video.app
    exit 0
fi

