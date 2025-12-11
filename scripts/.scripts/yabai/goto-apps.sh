#!/bin/bash

# application switcher/launcher for groups of apps

while getopts "a:p:" flag; do
    case $flag in
        a) apps=${OPTARG};;
        p) param=${OPTARG};;
    esac
done



case $apps in
    conference)
        if ps aux | grep 'Teams.app' | grep -v grep; then
            open -a 'Teams'
            exit 0
        fi
        if ps aux | grep 'zoom.us.app' | grep -v grep; then
            open -a 'zoom.us'
            exit 0
        fi
        open -a 'Jitsi Meet'
        ;;

    design)
        if ps aux | grep 'draw\.io' | grep -v grep; then
            open -a 'draw.io'
            exit 0
        fi
        if ps aux | grep 'Blender' | grep -v grep; then
            open -a 'Blender'
            exit 0
        fi
        if ps aux | grep 'GIMP' | grep -v grep; then
            open -a 'GIMP'
            exit 0
        fi
        open -a 'Inkscape'
        ;;

    entertainment)
        if ps aux | grep 'Music.app' | grep -v grep; then
            open -a 'Music'
            exit 0
        fi
        if ps aux | grep 'Disney' | grep -v grep; then
            open -a 'Disney+'
            exit 0
        fi
        if ps aux | grep 'Prime' | grep -v grep; then
            open -a 'Prime Video'
            exit 0
        fi
        if ps aux | grep 'YouTube' | grep -v grep; then
            open -a 'YouTube'
            exit 0
        fi
        if ps aux | grep 'Crunchyroll' | grep -v grep; then
            open -a 'Crunchyroll'
            exit 0
        fi
        if ps aux | grep 'Spotify' | grep -v grep; then
            open -a 'Spotify'
            exit 0
        fi
        open -a 'Crunchyroll'
        # open -a 'Spotify'
        ;;

    messages)
        # open -a "Instagram"
        open -a "WhatsApp"
        open -a "Reminders"
        ;;

    reminders)
        open -a "Calendar"
        open -a "Instagram"
        open -a "Stickies"
        ;;

    office)
        if ps aux | grep 'Pages.app' | grep -v grep; then
            open -a 'Pages'
            exit 0
        fi
        if ps aux | grep 'Numbers' | grep -v grep; then
            open -a 'Numbers'
            exit 0
        fi
        if ps aux | grep 'Keynote' | grep -v grep; then
            open -a 'Keynote'
            exit 0
        fi
        open -a 'ONLYOFFICE'
        ;;


    email)
        open -a 'Gmail'
        open -a 'Mail'
        ;;


    devbrowser) # open development browser
        reload="$param"
        development_browser="LibreWolf"
        open -a "$development_browser"
        # send a key combination to delete browser history and refresh the site
        if [[ -n $reload ]]; then
            /opt/homebrew/bin/sendkeys --application-name "$development_browser" --characters "<c:f9><c:r:command>"
        fi
        ;;

    virtualization)
        if ps aux | grep 'UTM' | grep -v grep; then
            open -a 'UTM'
            exit 0
        fi
        if ps aux | grep 'Screen Sharing' | grep -v grep; then
            open -a 'Screen Sharing'
            exit 0
        fi
        open -a 'Windows App'
        ;;
esac


# /opt/homebrew/bin/terminal-notifier -message "$apps" -title "goto"
