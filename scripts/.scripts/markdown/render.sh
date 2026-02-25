#!/usr/bin/env bash

htmltitle=$(basename "$1" | cut -d '.' -f 1)
filename=~/rendered.html
template=~/.scripts/markdown/template.html
command="/opt/homebrew/bin/pandoc -f gfm -t html -o '$filename' --template='$template' '$1' --metadata title='$htmltitle'"

echo "$command"
# echo "$command" | pbcopy
eval "$command"

open "$filename"



