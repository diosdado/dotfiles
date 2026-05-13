#!/usr/bin/env bash

template=~/.scripts/markdown/template.html

while getopts "rf:t:" flag; do
    case $flag in
        r) refresh_only=1;;
        f) filename=${OPTARG};;
        t) template=~/.scripts/markdown/template-${OPTARG}.html;;
    esac
done

if [[ -n $refresh_only ]]; then
    /opt/homebrew/bin/sendkeys --application-name "Safari" --characters "<c:r:command>"
    exit 0
fi


htmltitle=$(basename "$filename" | cut -d '.' -f 1)
location="/Users/david.diosdado/Library/Mobile Documents/com~apple~CloudDocs/Notes/rendered/$htmltitle.html"
command="/opt/homebrew/bin/pandoc -s --toc --toc-depth=1 -f gfm -t html -o '$location' --template='$template' '$filename' --metadata title='$htmltitle'"

# debug command
# echo "$command"
# echo "$command" | pbcopy

# execute command
eval "$command"

open "$location"

