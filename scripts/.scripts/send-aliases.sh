#!/bin/bash

current_app=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')
aliases_string="alias ll='ls -plah' ; alias la='ls -A' ; alias l='ls -CF'"
echo "$aliases_string" | tr -d '\n' | pbcopy
# sleep .5
# sudo -u "$(id -un)" -g "$(id -gn)" /opt/homebrew/bin/sendkeys --application-name "$current_app" --characters "<c:v:command>" --delay 0



# sudo -u "$(id -un)" -g "$(id -gn)" osascript -e 'tell application "System Events" to keystroke "v" using command down'








