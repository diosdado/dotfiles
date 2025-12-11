#!/usr/bin/env bash

filename=~/rendered.html
template=~/.scripts/markdown/template.html
command="/opt/homebrew/bin/pandoc -f gfm -t html -o '$filename' --template='$template' '$1'"

echo "$command"
# echo "$command" | pbcopy
eval "$command"

open "$filename"



