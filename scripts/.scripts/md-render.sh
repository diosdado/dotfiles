#!/usr/bin/env bash

filename=~/rendered.html

# /opt/homebrew/bin/grip "$1" --export --no-inline "$filename"

pandoc -f gfm -t html -o "$filename" --template=template.html "$1"

# pandoc "$0" -o "$filename" -t --template template.html

# pandoc "$1" -o $filename  -f markdown_github -t html "$1" --include-in-header github-markdown-dark.css > $filename

open "$filename"

# vim.keymap.set("n", "<leader>f", ":let @y = expand(\"%:p\")<CR>:~/dotfiles/scripts/.scripts/md-render.sh -f")
# ~/dotfiles/scripts/.scripts/md-render.sh

# vim.keymap.set("n", "<leader>ñ", "<cmd>w<CR>:!~/.scripts/yabai/goto-apps.sh -a devbrowser -p 1<CR><CR>")

# vim.keymap.set("n", "<leader>a", "mqggVG\"+y`qzz")
#
#
#
#
# pandoc your_document.md -o output.html --standalone --include-in-header styles.css

