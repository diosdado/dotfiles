vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Usar $ y 0 para inicio y final de línea omitiendo espacios
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "$", "g_")

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move code up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move next line to end of current line
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor cented on screen while doing page-up/page-down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search terms in the middle while navigating with n/N
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- code folding
vim.keymap.set("n", "<leader>9", "zfat")

-- map control+c to Esc, to keep consistency
vim.keymap.set("i", "<C-c>", "<Esc>")

-- disable quit with Q
vim.keymap.set("n", "Q", "<nop>")

-- select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- yank to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")

-- switch windows
vim.keymap.set({ "v", "n" }, "<leader>w", "<C-w>W")
vim.keymap.set({ "v", "n" }, "<leader>e", "<C-w>w")

-- close window
vim.keymap.set("n", "<leader>q", "<cmd>clo<CR>")
vim.keymap.set("v", "<leader>q", "<cmd>clo<CR>")

-- start a global replace whith the current word
vim.keymap.set("n", "<leader>s", [[:%s:\<<C-r><C-w>\>:<C-r><C-w>:gI<Left><Left><Left>]])

--
vim.keymap.set("n", "<leader>n", [[:e ~/Notes/.txt<Left><Left><Left><Left>]])

-- make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- source configuration
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- toggle wordwrap
vim.keymap.set("n", "<leader>-", function()
    vim.cmd("set wrap!")
end)

-- reformat entire file
vim.keymap.set("n", "<leader>r", vim.lsp.buf.format)

-- Resize splits
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Down>", "<C-w>-")
vim.keymap.set("n", "<C-Left>", "<C-w>>")
vim.keymap.set("n", "<C-Right>", "<C-w><")

-- remap up/down to multiline wordwrapped navigation
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- quickfix
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- save file, switch to browser and refresh
vim.keymap.set("n", "<leader>ñ", "<cmd>w<CR>:!~/.scripts/reload-browser-without-cache.sh<CR><CR>")

-- switch between the two last 2 buffers
vim.keymap.set("n", "<C-u>", ":bprev<CR>")
-- switch between the two last 2 buffers
vim.keymap.set("n", "<C-i>", ":bnext<CR>")
-- switch between the two last 2 buffers
vim.keymap.set("n", "<C-o>", ":b#<CR>")

-- copy line to clipboard
vim.keymap.set("n", "<leader>o", "^v$h\"+y")
-- show yabai window objects
vim.keymap.set("n", "<leader>¿", ":! yabai -m query --windows > ~/yabai-output.json<CR><CR>:e ~/yabai-output.json<CR>", { silent = true })
-- yank filename
vim.keymap.set("n", "<leader>f", ":let @\" = expand('%')<CR>")
-- new vsplit
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l")
-- netrw left panel
vim.keymap.set("n", "<leader>t", ":Lexplore<CR>:vertical resize 30<CR>")
