require("mason-lspconfig").setup({
    ensure_installed = { },
    automatic_enable = true,
    automatic_e = true,
})



require('mason-tool-installer').setup {
    ensure_installed = {
        'bash-language-server',
        'beautysh',
        'css-lsp',
        'eslint-lsp',
        'html-lsp',
        'lua-language-server',
        'phpactor',
        'pint',
        'prettier',
        'pyright',
        'some-sass-language-server',
        'sql-formatter',
        'stimulus-language-server',
        'stylelint',
    },
}
