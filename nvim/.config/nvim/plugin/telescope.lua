


local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local sandox_knowledge_base = '~/ownCloud/Bases-conocimiento'




-- current dir ignoring packages
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        file_ignore_patterns = {
            "^vendor/",
            "^node_modules/",
        }
    })
end, {})

-- current dir including hidden files
vim.keymap.set('n', '<leader>pd', function()
    builtin.find_files({
        hidden = true,
    })
end, {})

-- current dir live grep
vim.keymap.set("n", "<leader>pr", function()
    extensions.live_grep_args.live_grep_args({
        additional_args = function()
            return { "--hidden", "--no-ignore" }
        end,
        search_dirs = { vim.fn.getcwd() }
    })
end, {})

-- current git repo
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})

-- my own configuration files
vim.keymap.set('n', '<leader>pp', function()
    builtin.find_files({
        cwd = '~/dotfiles/',
        prompt_title = 'Preferences',
        hidden = true,
        file_ignore_patterns = {
            "blender/",
            ".git/",
        }
    })
end, {})

-- fast clipboard
vim.keymap.set('n', '<leader>pc', function()
    builtin.find_files({
        cwd = '~/clipboard/',
        prompt_title = 'Fast clipboard',
    })
end, {})

-- tmuxifier layouts
vim.keymap.set('n', '<leader>pl', function()
    builtin.find_files({
        cwd = '~/.tmuxifier/layouts/',
        prompt_title = 'Tmuxifier',
    })
end, {})

-- last opened files
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})

-- current opened buffers
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

-- nvim help files
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

-- lsp symbols
vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, {})

-- knowledge base
vim.keymap.set('n', '<leader>pk', function()
    builtin.find_files({
        cwd = sandox_knowledge_base,
        prompt_title = 'Sandox Knownledge Base',
    })
end, {})


-- personal notes ---------------------------------------------------------------------------------

-- by title
vim.keymap.set('n', '<leader>pn', function()
    builtin.find_files({
        cwd = '~/Notes',
        prompt_title = 'Notes by title',
    })
end, {})

-- by contents
vim.keymap.set('n', '<leader>pt', function()
    extensions.live_grep_args.live_grep_args({
        cwd = '~/Notes',
        prompt_title = 'Notes by content',
    })
end, {})



-- laravel files
vim.keymap.set('n', '<leader>ll', function(opts)
    local types_titles = {
        "migrations",
        "models",
        "controllers",
        "views",
    }
    local types = {
        migrations = {
            cwd = './database/migrations',
            prompt_title = 'Laravel Migrations',
        },
        models = {
            cwd = './app/Models',
            prompt_title = 'Laravel Models',
        },
        controllers = {
            cwd = './app/http/Controllers',
            prompt_title = 'Laravel Controllers',
        },
        views = {
            cwd = './resources/views',
            prompt_title = 'Laravel Views',
        },
    }

    pickers.new({}, {
        prompt_title = "Laravel Search",
        finder = finders.new_table({
            results = types_titles }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<CR>', function(prompt_bufnr)
                local selected = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                builtin.find_files(types[selected[1]])
            end)
            return true
        end,
    }):find()
end, {})
