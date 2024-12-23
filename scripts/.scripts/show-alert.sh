#!/usr/bin/env bash


OIFS="$IFS"
IFS=$'\n'

~/.scripts/fast-clipboard-contents.sh -f ~/.cb.txt

contents=$(cat ~/.cb.txt)

title="meh
    mew"

alert_script="tell app \"System Events\" to display alert \"$title\" message \"$contents\""

osascript -e "$alert_script"

echo $dialogText;

IFS="$OIFS"
