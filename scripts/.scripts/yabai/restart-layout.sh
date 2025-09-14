#!/usr/bin/env bash
terminal-notifier -message "rstart layout" -title "Yabai"
while getopts "l:" flag; do
    case $flag in
        l) layout=${optarg};;
    esac
done


~/.scripts/yabai/set-labels.sh

sleep 0.2

/opt/homebrew/bin/yabai -m rule --apply

sleep 0.2

~/.scripts/yabai/set-layout.sh -l "$layout"
