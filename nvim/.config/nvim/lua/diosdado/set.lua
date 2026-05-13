-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.nu = true
vim.opt.relativenumber = true


-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true


-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.hidden = true
vim.opt.encoding = "UTF-8"
vim.opt.path:append('**')
-- vim.opt.iskeywordd('-')

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.mouse = "a"

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.winblend = 0
vim.opt.pumblend = 10
vim.opt.conceallevel = 0
vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    trail = '.',
    eol = "↲",
    multispace = '→   ',
    nbsp = '␣',
    precedes = '←',
    extends = '→',
}

-- Netrw
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
vim.g.netrw_list_hide = '.DS_Store,.git'
vim.g.netrw_hide = 1
vim.g.tmux_navigator_disable_netrw_workaround = 1


-- Cursor size and blinking
vim.o.guicursor = table.concat({
    "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",  -- block cuersor on normal, visual and command modes
    "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",   -- vertical bar cursor of a 25% width of the chararcter on insert and command-insert modes
    "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"        -- horizontal var of a 50% height of the character size on replace mode
}, ",")

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Open the buffer at the last edited location
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Balance split layout on terminal resize
vim.api.nvim_create_autocmd("VimResized", {
    group = augroup,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function()
        Save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", Save_cursor)
    end,
})

-- Wordwrap on text files
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.txt" },
    callback = function() vim.cmd("set wrap") end
})


-- Autocomplete
vim.o.complete = '.,w,b,o'
vim.o.completeopt = 'menuone,noselect,fuzzy'
vim.o.autocomplete = true
vim.o.autocompletedelay = 250
-- disable autocomplete in telescope prompt
vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopePrompt",
    callback = function()
        vim.opt_local.complete = ''
    end,
})







