#!/bin/bash

title="Alert"

while getopts m:t: flag
do
    case "${flag}" in
        m) message=${OPTARG};;
        t) title=${OPTARG};;
    esac
done

alert_script="tell app \"System Events\" to display dialog \"$message\" with title \"$title\""
osascript -e "$alert_script"
