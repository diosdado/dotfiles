local builtin = require('telescope.builtin')


-- DEFAULT SEARCH IGNORES PACKAGES ----------------------------------------------------------------
vim.keymap.set('n', '<leader>pf', function()
    require('telescope.builtin').find_files({
        file_ignore_patterns = {
            "^vendor/",
            "^node_modules/",
        }
    })
end, {})


vim.keymap.set('n', '<leader>pp', function()
    require('telescope.builtin').find_files({
        cwd = '~/dotfiles/',
        prompt_title = 'Preferences',
        hidden = true,
        file_ignore_patterns = {
            "blender/",
            ".git/",
        }
    })
end, {})

-- SEARCH INCLUDING HIDDEN FILES ------------------------------------------------------------------
vim.keymap.set('n', '<leader>pd', function()
    require('telescope.builtin').find_files({
        hidden = true,
    })
end, {})


-- HANDY TELESCOPE SEARCH TYPES -------------------------------------------------------------------
-- Current repo
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
-- Current opened buffers
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
-- Nvim help files
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
-- LSP Symbols
vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, {})
-- Last opened files
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})
-- ?
vim.keymap.set('n', '<leader>pw', builtin.grep_string, {})
-- Live grep in files
vim.keymap.set("n", "<leader>pr", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")


-- SEARCH WITHIN MY NOTES -------------------------------------------------------------------------
-- By title
vim.keymap.set('n', '<leader>pn', function()
    require('telescope.builtin').find_files({
        cwd = '~/Notes',
        prompt_title = 'Notes by title',
    })
end, {})
-- By contents
vim.keymap.set('n', '<leader>pnn', function()
    require('telescope').extensions.live_grep_args.live_grep_args({
        cwd = '~/Notes',
        prompt_title = 'Notes by content',
    })
end, {})


-- LARAVEL SHORTCUTS ------------------------------------------------------------------------------
-- Migrations
vim.keymap.set('n', '<leader>lg', function()
    require('telescope.builtin').find_files({
        prompt_title = 'Laravel Migrations',
        cwd = './database/migrations',
    })
end, {})
-- Models
vim.keymap.set('n', '<leader>lm', function()
    require('telescope.builtin').find_files({
        cwd = './app/Models',
        prompt_title = 'Laravel Models',
    })
end, {})
-- Controllers
vim.keymap.set('n', '<leader>lc', function()
    require('telescope.builtin').find_files({
        cwd = './app/http/Controllers',
        prompt_title = 'Laravel Controllers',
    })
end, {})
-- Controllers
vim.keymap.set('n', '<leader>lv', function()
    require('telescope.builtin').find_files({
        cwd = './resources/views',
        prompt_title = 'Laravel Views',
    })
end, {})
