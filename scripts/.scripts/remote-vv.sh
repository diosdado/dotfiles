#!/usr/bin/env bash

selected=$(find ~/Downloads -mindepth 1 -maxdepth 1 -type f ! -name "*.vv" | fzf)

remote-viewer $selected


# find ~/Downloads -mindepth 1 -maxdepth 1 -type f ! -name "*.*" -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1
# find /dir/path -type f -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1

#  find /dir/path -type f -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1



