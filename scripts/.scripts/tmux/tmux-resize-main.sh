#!/usr/bin/env bash

sleep 0.1

dwidth=$(tmux display -p '#{window_width}')
dheight=$(tmux display -p '#{window_height}')

new_width=$(expr $dwidth / 3 \* 2)
new_height=$(expr $dheight / 3 \* 2)

tmux resize-pane -t 1 -x $new_width -y $new_height
