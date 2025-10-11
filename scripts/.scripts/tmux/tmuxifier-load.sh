#!/usr/bin/env bash

# lists all tmuxifier layouts available to select one and launch it


selected=$(find ~/.tmuxifier/layouts -name '*.session.sh' -mindepth 1 -maxdepth 1 -type f | fzf)
filename=$(basename $selected)
layout=${filename//'.session.sh'/}
tmuxifier load-session $layout
