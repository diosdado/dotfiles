#!/usr/bin/env bash

htmltitle=$(basename "$1" | cut -d '.' -f 1)
location="/Users/david.diosdado/Library/Mobile Documents/com~apple~CloudDocs/Notes/rendered/$htmltitle.html"
template=~/.scripts/markdown/template.html
command="/opt/homebrew/bin/pandoc -f gfm -t html -o '$location' --template='$template' '$1' --metadata title='$htmltitle'"

echo "$command"
# echo "$command" | pbcopy
eval "$command"

open "$location"



