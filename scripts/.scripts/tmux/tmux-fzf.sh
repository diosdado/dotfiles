#!/usr/bin/env sh

# stolen from https://github.com/christoomey/dotfiles/blob/f4f9da69586503823de9ff075fbf627ec2bb6fb5/tmux/tmux.conf#L107
tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux switch-client -t

