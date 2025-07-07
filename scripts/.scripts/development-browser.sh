#!/bin/bash

# used for web development
# switches to browser used for development and executes a key combination
# to delete history and refresh the current tab

while getopts r flag
do
    case "${flag}" in
        r) reload="1";;
    esac
done


development_browser="LibreWolf"

    open "/Applications/$development_browser.app"

if [[ -n $reload ]]; then
    sendkeys --application-name "$development_browser" --characters "<c:f9><c:r:command>"
else
    open "/Applications/$development_browser.app"
    sendkeys --application-name "$development_browser" --characters "<c:f9><c:r:command>"
fi








