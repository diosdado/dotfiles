-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)



require('lazy').setup({
    'tpope/vim-commentary',           -- comments
    'tpope/vim-surround',             -- surround with tags etc
    'tpope/vim-repeat',               -- patch to use the repeat command (.) multiple times
    'tpope/vim-fugitive',             -- git
    'lewis6991/gitsigns.nvim',        -- git gutter indicators
    'ThePrimeagen/harpoon',           -- harpoon
    'christoomey/vim-tmux-navigator', -- tmux panes
    'mbbill/undotree',                -- undo sidebar
    'catppuccin/nvim',                -- theme

    -- vim line interface
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },

    -- mason
    {
        'mason-org/mason-lspconfig.nvim',
        opts = {},
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'neovim/nvim-lspconfig',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
    },


})
