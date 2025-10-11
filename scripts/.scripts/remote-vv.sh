#!/usr/bin/env bash

selected=$(find ~/Downloads -Art -mindepth 1 -maxdepth 1 -type f ! -name "*.vv" | tail -n 1)

/opt/homebrew/bin/remote-viewer $selected

