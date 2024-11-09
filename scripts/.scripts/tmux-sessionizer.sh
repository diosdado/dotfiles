#!/usr/bin/env bash

# based on the tmux sessionizer by theprimeagen
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
# uses fzf


OIFS="$IFS"
IFS=$'\n'

# get parameters from flag
while getopts d:s flag
do
    case "${flag}" in
        d) directory=${OPTARG};; # create session in specific directory
        s) watch_sass="1";; # create extra split for sass watch compilation
    esac
done

# select the directory to create a session
if [[ -n $directory ]]; then
    selected=$directory
else
    selected=$(find ~/Desktop/Projects/Development/ -mindepth 2 -maxdepth 2 -type d | fzf)
fi

# abort if there is no selected directory
if [[ -z $selected ]]; then
    exit 0
fi

# set session name to the directory name
selected_name=$(basename "$selected" | tr . _)
# get the tmux process id
tmux_running=$(pgrep tmux)

# -------------------------------------------------------------------------------------------------
# I use two specific layouts of tmux session:
# - one with two panes, one for neovim and the other for a terminal
# - one with three panes: neovim, terminal and a third one for a sass compiler observer for css
# -------------------------------------------------------------------------------------------------

# settings for new tmux session
_s="$selected_name -c $selected \\; "
_s+="split-window -v \\; "
_s+="send-keys -t 1.1 \"nvim .\" Enter \\; "
_s+="send-keys -t 1.2 \"cd $selected\" Enter \\; "
_s+="send-keys -t 1.2 \"clear\" Enter \\; "
_s+="resize-pane -t 1.2 -y 10% \\; "
# create new terminal to watch for file changes in sass files
if [[ -n $watch_sass ]]; then
    _s+="split-window -t 1.2 -h \\; "
    _s+="send-keys -t 1.3 \"cd $selected\" Enter \\; "
    _s+="send-keys -t 1.3 \"sass --watch sass:css assets/sass:assets/css public/assets/sass:public/assets/css\" Enter \\; "
fi
_s+="select-pane -t 1.1 \\; "


# tmux is not running
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    eval "tmux new-session -s $_s attach"
    exit 0
fi

# tmux is running and the session doesn't exists
if ! tmux has-session -t=$selected_name 2> /dev/null; then
    eval "tmux new-session -ds $_s"
fi

# switch to the existing tmux session with the name
tmux attach \; switch-client -t $selected_name

IFS="$OIFS"
