#!/usr/bin/env bash

exit


message=$(/opt/homebrew/bin/SwitchAudioSource -m toggle -t input)

filename=~/rendered.html
# /opt/homebrew/bin/terminal-notifier -message "$message" -title "SwitchAudioSource"


if [[ $message == *"unmuted"* ]]; then
    # echo 'yes';
    echo -n "green" > /dev/udp/localhost/1738
else
    echo -n "red" > /dev/udp/localhost/1738
fi


