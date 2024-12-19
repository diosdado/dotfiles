#!/usr/bin/env bash

# based on theprimeagen's cheatsheet https://github.com/ThePrimeagen/./blob/master/bin/.local/scripts/tmux-cht.sh

selected=`cat ~/.scripts/.tmux-cht-languages ~/.scripts/.tmux-cht-commands | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

escaped_query=$(echo $query | tr ' ' '+')
is_language=$(grep "$selected" ~/.scripts/.tmux-cht-languages)

if [[ -n $is_language ]]; then
    if [[ -z $escaped_query ]]; then
        list_url="cht.sh/$selected/:list"
        escaped_query=$(curl $list_url | fzf)
    fi
    url="cht.sh/$selected/$escaped_query"
else
    url="cht.sh/$selected~$escaped_query"
fi

tmux neww bash -c "echo \"$url\" & curl $url | less -r"
