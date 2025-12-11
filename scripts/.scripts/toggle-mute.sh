#!/usr/bin/env bash

message=$(/opt/homebrew/bin/SwitchAudioSource -m toggle -t input)

/opt/homebrew/bin/terminal-notifier -message "$message" -title "SwitchAudioSource"
