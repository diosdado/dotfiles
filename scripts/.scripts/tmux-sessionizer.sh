#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Desktop/Projects/Development/ -mindepth 2 -maxdepth 3 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi


selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)


if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected \; \
        split-window -h \; \
        send-keys -t 1.1 "nvim ." Enter \; \
        send-keys -t 1.2 "cd $selected" Enter \; \
        send-keys -t 1.2 "clear" Enter \; \
        select-pane -t 1.1 \; \
        attach
    exit 0
fi


if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected \; \
        split-window -h \; \
        send-keys -t 1.1 "nvim ." Enter \; \
        send-keys -t 1.2 "cd $selected" Enter \; \
        send-keys -t 1.2 "clear" Enter \; \
        select-pane -t 1.1 \; \
        attach
fi

tmux attach \; switch-client -t $selected_name
