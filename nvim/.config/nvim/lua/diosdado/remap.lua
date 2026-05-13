--------------------------------------------------------------------------------------------------
-- leader and esc
--------------------------------------------------------------------------------------------------

-- map control+c to Esc, to keep consistency
vim.keymap.set("i", "<C-c>", "<Esc>")

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--------------------------------------------------------------------------------------------------
-- navigation
--------------------------------------------------------------------------------------------------

-- use $ and 0  to navigate start and end without spaces
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

-- zoom
vim.keymap.set("n", "zi", "<c-w>|")
vim.keymap.set("n", "zo", "<c-w>=")
vim.keymap.set("n", "zx", "<c-w>x")


--------------------------------------------------------------------------------------------------
-- manipulation
--------------------------------------------------------------------------------------------------

-- move next line to end of current line
vim.keymap.set("n", "J", "mzJ`z")

-- reformat entire file
vim.keymap.set("n", "<leader>r", vim.lsp.buf.format)

-- start a global replace whith the current word
vim.keymap.set("n", "<leader>s", [[:%s:\<<C-r><C-w>\>:<C-r><C-w>:gI<Left><Left><Left>]])

-- remove windows newline chars ^M
vim.keymap.set("n", "<leader>z", ":%s:\\r::g<CR>")


--------------------------------------------------------------------------------------------------
-- disable some default shortcuts
--------------------------------------------------------------------------------------------------

-- disable quit with Q and ZZ
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "ZZ", "<nop>")

-- disable tab
vim.keymap.set("n", "<tab>", "<nop>")

-- select all
vim.keymap.set("n", "<leader>a", "mqggVG\"+y`qzz")


--------------------------------------------------------------------------------------------------
-- buffers
--------------------------------------------------------------------------------------------------

-- close window
vim.keymap.set("n", "<leader>q", "<cmd>clo<CR>")

-- delete buffer
vim.keymap.set("n", "<leader>D", ":bd!<CR>")

-- delete buffer
vim.keymap.set("n", "<leader>G", ":bufdo bd<CR>")

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- new vsplit
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l")

-- toggle wordwrap
vim.keymap.set("n", "<leader>-", function() vim.cmd("set wrap!") end)
vim.keymap.set("n", "<leader>/", function() vim.cmd("set wrap!") end)

-- Cycle through buffers
vim.keymap.set('n', '∆', '<Cmd>bp<CR>') -- Alt+j
vim.keymap.set('n', '˚', '<Cmd>bn<CR>') -- Alt+k
vim.keymap.set("n", "¬", ":b#<CR>") -- Alt+l


--------------------------------------------------------------------------------------------------
-- Marks
--------------------------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>m", ":marks<CR>")


--------------------------------------------------------------------------------------------------
-- Quickfix
--------------------------------------------------------------------------------------------------

-- Cycle through quickfix list items
vim.keymap.set('n', '‘', '<Cmd>try | cnext | catch | cfirst | catch | endtry<CR>') -- alt+]
vim.keymap.set('n', '“', '<Cmd>try | cprevious | catch | clast | catch | endtry<CR>') -- alt+[

-- Clear quickfix list
vim.keymap.set('n', '<leader>)', '<Cmd>:cexpr []<CR>')

-- Toggle quickfix
vim.keymap.set('n', '<leader>c', function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd "cclose"
        return
    end
    vim.cmd "copen"
end, {})


--------------------------------------------------------------------------------------------------
-- yank to clipboard
--------------------------------------------------------------------------------------------------

-- yank to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")

-- line to clipboard
vim.keymap.set("n", "<leader>o", "^v$h\"+y")

-- word to clipboard
vim.keymap.set("n", "<leader>w", "viw\"+y")

-- ' to clipboard
vim.keymap.set("n", "<leader>'", "vi'\"+y")

-- " to clipboard
vim.keymap.set("n", "<leader>\"", "vi\"\"+y")


--------------------------------------------------------------------------------------------------
-- filenames
--------------------------------------------------------------------------------------------------

-- copy absolute filename
vim.keymap.set("n", "<leader>f", ":let @* = expand(\"%:p\")<CR>")

-- open file location
vim.keymap.set("n", "<leader>F", ":! open \"%:p:h\"<CR><CR>", { silent = true })

-- use line as filename and open it in a new buffer
vim.keymap.set("n", "<leader>e", "^v$h\"zy<ESC>:e <C-R>z<CR>")


--------------------------------------------------------------------------------------------------
-- etc
--------------------------------------------------------------------------------------------------

-- save file, switch to browser and refresh
vim.keymap.set("n", "<leader>ñ", "<cmd>w<CR>:!~/.scripts/yabai/goto-apps.sh -a devbrowser -p 1<CR><CR>")
vim.keymap.set("n", "<leader>;", "<cmd>w<CR>:!~/.scripts/yabai/goto-apps.sh -a devbrowser -p 1<CR><CR>")

-- make the current file executable
vim.keymap.set("n", "<leader>x", ":! chmod +x %<CR>")

-- show yabai window objects
vim.keymap.set("n", "«", ":! yabai -m query --windows > ~/.yabai-output.json<CR><CR>:e ~/.yabai-output.json<CR>",
    { silent = true }) -- alt+\

-- create new note
vim.keymap.set("n", "<leader>n", [[:e ~/Notes/.md<Left><Left><Left>]])

-- source configuration
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)

-- view LSP configuration for file
vim.keymap.set("n", "<leader>i", "<cmd>checkhealth vim.lsp<CR>")

-- render markdown file to html
vim.keymap.set("n", "<leader>R", ":w <CR> :! ~/.scripts/markdown/render.sh -t 0 -f \"%:p\" <CR><CR>")
vim.keymap.set("n", "<leader>T", ":w <CR> :! ~/.scripts/markdown/render.sh -t 1 -f \"%:p\" <CR><CR>")

-- render markdown in neovim
vim.keymap.set("n", "<leader>d", ":RenderMarkdown toggle<CR>", { silent = true })


--------------------------------------------------------------------------------------------------
-- php utils
--------------------------------------------------------------------------------------------------

-- php turn parameters to variables
-- vim.keymap.set("v", "<leader>$", "<cmd>'<,'>s:\\([a-z0-9_]*\\)\\([,\\n]\\):$\\1\\2:g<CR>")







