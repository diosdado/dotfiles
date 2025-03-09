-- require("mason").setup()
-- require("mason-lspconfig").setup({
--     ensure_installed = { 'phpactor' },
--     handlers = {
--         function(server_name)
--             require('lspconfig')[server_name].setup({})
--         end,
--     },
-- })


--blade-formatter
--eslint-lsp eslint
--html-lsp html
--intelephense
--lua-language-server lua_ls
--sql-formatter
--stylelint
--typescript-language-server tsserver

-- require("lspconfig")["blade-formatter"].setup({})
-- require("lspconfig")["eslint-lsp"].setup({})
-- require("lspconfig")["html-lsp"].setup({})
-- require("lspconfig")["intelephense"].setup({})
-- require("lspconfig")["lua-language-server"].setup({})
-- require("lspconfig")["sql-formatter"].setup({})
-- require("lspconfig")["stylelint"].setup({})
-- require("lspconfig")["typescript-language-server"].setup({})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
