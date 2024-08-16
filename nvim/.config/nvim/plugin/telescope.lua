local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pt', function()
    require('telescope').extensions.live_grep_args.live_grep_args({
        cwd = '~/Notes',
        prompt_title = 'Notes by tags',
        default_text = '\\{\\{\\{',
    })
end, {})

vim.keymap.set('n', '<leader>pn', function()
    require('telescope.builtin').find_files({
        cwd = '~/Notes',
        prompt_title = 'Notes by title',
    })
end, {})

vim.keymap.set('n', '<leader>pnn', function()
    require('telescope').extensions.live_grep_args.live_grep_args({
        cwd = '~/Notes',
        prompt_title = 'Notes by content',
    })
end, {})

vim.keymap.set('n', '<leader>pc', function()
    require('telescope.builtin').find_files({
        cwd = '~/.config',
        prompt_title = 'Configuration files',
    })
end, {})

vim.keymap.set('n', '<leader>pf', function()
    require('telescope.builtin').find_files({
        hidden = true,
    })
end, {})

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>pw', builtin.grep_string, {})
vim.keymap.set("n", "<leader>pr", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")



-- vim.keymap.set("n", "<leader>pd", ":Telescope find_files hidden=true"
