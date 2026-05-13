#!/usr/bin/env bash

sync_status=$(tmux show-option -w synchronize-panes)

if [[ $sync_status == 'synchronize-panes on' ]]; then
   tmux set-window-option synchronize-panes off
   # tmux set-option -g @dracula-synchronize-panes-colors "yellow dark_gray"
   tmux set-window-option pane-border-style fg=#44475A
   tmux set-window-option pane-active-border-style fg=#BD93F9
else
   tmux set-window-option synchronize-panes on
   # tmux set-option -g @dracula-synchronize-panes-colors "red dark_gray"
   tmux set-window-option pane-border-style "fg=black bg=#FF5555"
   tmux set-window-option pane-active-border-style "fg=black bg=#FF5555"
fi


# ~/.tmux/plugins/tmux/scripts/dracula.sh
