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


development_browser="Firefox Developer Edition"


if [[ -n $reload ]]; then
    sendkeys --application-name "$development_browser" --characters "<c:r:command,shift><c:r:command>"
else
    open "/Applications/$development_browser.app"
fi








