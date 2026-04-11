#!/usr/bin/env bash

sync_status=$(tmux show-option -w synchronize-panes)

if [[ $sync_status == 'synchronize-panes on' ]]; then
   tmux set-window-option synchronize-panes off
   tmux set-window-option pane-border-style fg=#44475A
   tmux set-window-option pane-active-border-style fg=#BD93F9
else
   tmux set-window-option synchronize-panes on
   tmux set-window-option pane-border-style fg=red
   tmux set-window-option pane-active-border-style fg=red
fi
