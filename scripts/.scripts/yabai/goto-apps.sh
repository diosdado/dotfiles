#!/bin/bash


while getopts "a:p:" flag; do
    case $flag in
        a) apps=${OPTARG};;
        p) param=${OPTARG};;
    esac
done



case $apps in
    conference)
        if ps aux | grep 'Teams.app' | grep -v grep; then
            open /Applications/Teams.app
            exit 0
        fi
        if ps aux | grep 'Zoom.app' | grep -v grep; then
            open /Applications/zoom.us.app
            exit 0
        fi
        open /Applications/Jitsi\ Meet.app
        ;;

    design)
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
        open /Applications/Inkscape.app
        ;;

    music)
        if ps aux | grep 'Music.app' | grep -v grep; then
            open /System/Applications/Music.app
            exit 0
        fi
        open ~/Applications/Brave\ Browser\ Apps.localized/Spotify.app
        ;;

    tv)
        if ps aux | grep 'Crunchyroll' | grep -v grep; then
            open ~/Applications/Brave\ Browser\ Apps.localized/Crunchyroll\ -\ Watch\ Popular\ Anime.app
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
        ;;



    reminders)
        open -a "Calendar"
        open -a "Reminders"
        ;;

    office)
        if ps aux | grep 'Pages' | grep -v grep; then
            open /Applications/Pages.app
            exit 0
        fi
        if ps aux | grep 'Numbers' | grep -v grep; then
            open /Applications/Numbers.app
            exit 0
        fi
        if ps aux | grep 'Keynote' | grep -v grep; then
            open /Applications/Keynote.app
            exit 0
        fi
        open /Applications/ONLYOFFICE.app
        ;;


    email)
        open ~/Applications/Gmail.app
        open /System/Applications/Mail.app
        ;;


    devbrowser) # open development browser
        reload="$param"
        development_browser="LibreWolf"
        open "/Applications/$development_browser.app"
        # send a key combination to delete browser history and refresh the site
        if [[ -n $reload ]]; then
            /opt/homebrew/bin/sendkeys --application-name "$development_browser" --characters "<c:f9><c:r:command>"
        fi
        ;;

    virtualization)
        if ps aux | grep 'UTM' | grep -v grep; then
            open /Applications/UTM.app
            exit 0
        fi
        if ps aux | grep 'Screen Sharing' | grep -v grep; then
            open /System/Applications/Utilities/Screen\ Sharing.app
            exit 0
        fi
        open /Applications/Windows\ App.app
        ;;
esac


# /opt/homebrew/bin/terminal-notifier -message "$apps" -title "goto"
