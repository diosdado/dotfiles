
--------------------------------------------------------------------------------------------------
-- leader and esc
--------------------------------------------------------------------------------------------------

-- map control+c to Esc, to keep consistency
vim.keymap.set("i", "<C-c>", "<Esc>")
-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--------------------------------------------------------------------------------------------------
-- latin american iso keyboard accomodations
--------------------------------------------------------------------------------------------------

-- vim.keymap.set("n", "'", "`")
-- vim.keymap.set("n", ",", ";")
-- vim.keymap.set("n", ";", ",")
vim.keymap.set("n", "<leader>m", ":marks<CR>")

--------------------------------------------------------------------------------------------------
-- navigation
--------------------------------------------------------------------------------------------------

-- use $ and 0  to navigate start and end without spaces
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "$", "g_")
-- move code up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- keep cursor cented on screen while doing page-up/page-down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep search terms in the middle while navigating with n/N
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- code folding
vim.keymap.set("n", "<leader>9", "zfat")
-- remap up/down to multiline wordwrapped navigation
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--------------------------------------------------------------------------------------------------
-- manipulation
--------------------------------------------------------------------------------------------------

-- move next line to end of current line
vim.keymap.set("n", "J", "mzJ`z")
-- reformat entire file
vim.keymap.set("n", "<leader>r", vim.lsp.buf.format)
-- start a global replace whith the current word
vim.keymap.set("n", "<leader>s", [[:%s:\<<C-r><C-w>\>:<C-r><C-w>:gI<Left><Left><Left>]])

vim.keymap.set("v", "<leader>sn", [[:s:\([^ ]*\):!is_null(\1) \&\&<CR>]])
vim.keymap.set("v", "<leader>se", [[:s:\(.*\):echo '\1 \: ' \. $\1 . '<br>';<CR>]])
vim.keymap.set("v", "<leader>so", [[:s:\(.*\):<option value="\1">\1</option><CR>]])
vim.keymap.set("v", "<leader>s$", [[:s:\(.*\):$\1 = sx_normalized_post_var('\1');<CR>]])
vim.keymap.set("v", "<leader>sv", [[:s:^[  ]*\(.*\), *\(.*\):<option value="\1">\2</option><CR>]])
vim.keymap.set("v", "<leader>s'", [[:s:['"]*::g<CR>]])

-- remove windows newline chars ^M
vim.keymap.set("n", "<leader>z", ":%s:\\r::g<CR>")
-- change case
vim.keymap.set("n", "<leader>[", "viwu")
vim.keymap.set("n", "<leader>]", "viwU")

--------------------------------------------------------------------------------------------------
-- disable some default shortcuts
--------------------------------------------------------------------------------------------------

-- disable quit with Q
vim.keymap.set("n", "Q", "<nop>")
-- disable tab
vim.keymap.set("n", "<tab>", "<nop>")
-- select all
vim.keymap.set("n", "<leader>a", "ggVG")

vim.keymap.set("v", "u", "<nop>")
--------------------------------------------------------------------------------------------------
-- buffers
--------------------------------------------------------------------------------------------------
-- use line as filename and open it in a new buffer
vim.keymap.set("n", "<leader>e", "^v$h\"zy<ESC>:e <C-R>z<CR>")
-- close window
vim.keymap.set("n", "<leader>q", "<cmd>clo<CR>")
-- close buffer
vim.keymap.set("n", "<leader>Q", ":q!<CR>")
-- delete buffer
vim.keymap.set("n", "<leader>D", ":bd!<CR>")
-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- new vsplit
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l")
-- netrw left panel
vim.keymap.set("n", "<leader>t", ":Lexplore<CR>:vertical resize 30<CR>")
-- toggle wordwrap
vim.keymap.set("n", "<leader>-", function()
    vim.cmd("set wrap!")
end)
-- switch between the two last 2 buffers
vim.keymap.set("n", "<home>", ":b#<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--------------------------------------------------------------------------------------------------
-- yank to clipboard
--------------------------------------------------------------------------------------------------

-- yank to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
-- copy line to clipboard
vim.keymap.set("n", "<leader>o", "^v$h\"+y")
-- copy word to clipboard
vim.keymap.set("n", "<leader>w", "viw\"+y")
-- copy parenthesis to clipboard
vim.keymap.set("n", "<leader>b", "vib\"+y")
-- copy block to clipboard
vim.keymap.set("n", "<leader>%", "vi%\"+y")
-- copy ' to clipboard
vim.keymap.set("n", "<leader>'", "vi'\"+y")
-- copy " to clipboard
vim.keymap.set("n", "<leader>\"", "vi\"\"+y")
-- copy absolute filename
vim.keymap.set("n", "<leader>ff", ":let @* = expand(\"%:p\")<CR><CR>")
-- copy relative filename
vim.keymap.set("n", "<leader>fr", ":let @* = expand(\"%:f\")<CR><CR>")
-- copy only filename
vim.keymap.set("n", "<leader>f", ":let @* = expand(\"%:t\")<CR><CR>")

--------------------------------------------------------------------------------------------------
-- etc
--------------------------------------------------------------------------------------------------

-- replace in selection
vim.keymap.set("v", "<leader>r", ':s::g<Left><Left>')
-- save file, switch to browser and refresh
vim.keymap.set("n", "<leader>ñ", "<cmd>w<CR>:!~/.scripts/development-browser.sh -r<CR><CR>")
vim.keymap.set("n", "<leader>;", "<cmd>w<CR>:!~/.scripts/development-browser.sh -r<CR><CR>")
-- make the current file executable
vim.keymap.set("n", "<leader>x", ":! chmod +x %<CR>")
-- show yabai window objects
vim.keymap.set("n", "<leader>/", ":! yabai -m query --windows > ~/.yabai-output.json<CR><CR>:e ~/.yabai-output.json<CR>", { silent = true })
-- create new note
vim.keymap.set("n", "<leader>n", [[:e ~/Notes/.txt<Left><Left><Left><Left>]])
-- source configuration
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>i", "<cmd>LspInfo<CR>")


-- php convertir parametros en variables
-- vim.keymap.set("v", "<leader>$", "<cmd>'<,'>s:\\([a-z0-9_]*\\)\\([,\\n]\\):$\\1\\2:g<CR>")

