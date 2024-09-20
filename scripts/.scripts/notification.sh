#!/bin/bash

title="Notification"

while getopts m:t: flag
do
    case "${flag}" in
        m) message=${OPTARG};;
        t) title=${OPTARG};;
    esac
done

notification_script="display notification \"$message\" with title \"$title\""
osascript -e "$notification_script"
