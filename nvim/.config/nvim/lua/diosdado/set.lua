vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
-- vim.opt.mouse = ""

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"
vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    trail = '.',
    -- eol = "↲",
    multispace = '→   ',
    nbsp = '␣',
    precedes = '←',
    extends = '→',
}

vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}, ",")

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
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


vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = {
        "*.txt"
    },
    callback = function()
        vim.cmd("set wrap")
    end
})



vim.g.python3_host_prog = '/opt/miniconda3/envs/tensorflow/bin/python'
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'



-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = {
--         "*"
--     },
--     callback = function()
--         print(vim.api.nvim_buf_get_name(0))
--         vim.fn.jobstart(
--             'echo hello',
--             {
--                 on_exit = function()
--                     print('exit')
--                 end,
--                 on_stdout = function()
--                     print('stdout')
--                 end,
--                 on_stderr = function()
--                     print('stderr')
--                 end
--             }
--         )
--     end
-- })

