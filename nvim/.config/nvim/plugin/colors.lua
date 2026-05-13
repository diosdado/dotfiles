function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

    local custom = {
        cursorFg    = "#484882",
        cursorBg    = "#ffb86c",
        cursorLine  = "#484882",
        whitespace  = "#444659",
        visual      = "#254eab",
        highlight   = "#82B1FF",
        lineNr      = "#8D74AD",
        transparent = "NONE",
    }

	vim.api.nvim_set_hl(0, "Normal",                    { bg = custom.transparent })
	vim.api.nvim_set_hl(0, "NormalFloat",               { bg = custom.transparent })
	vim.api.nvim_set_hl(0, "NormalNC",                  { bg = custom.transparent })
    vim.api.nvim_set_hl(0, "Cursor",                    { fg = custom.cursorFg,     bg = custom.cursorBg })
    vim.api.nvim_set_hl(0, "CursorLine",                { fg = custom.transparent,  bg = custom.cursorLine })
    vim.api.nvim_set_hl(0, "Visual",                    { fg = custom.transparent,  bg = custom.visual })
    vim.api.nvim_set_hl(0, "Whitespace",                { fg = custom.whitespace,   bg = custom.transparent })
    vim.api.nvim_set_hl(0, "NonText",                   { fg = custom.whitespace,   bg = custom.transparent })
    vim.api.nvim_set_hl(0, "TelescopeBorder",           { fg = custom.highlight,    bg = custom.transparent })
    vim.api.nvim_set_hl(0, "TelescopeSelection",                { fg = custom.transparent,  bg = custom.cursorLine })
    vim.api.nvim_set_hl(0, "LineNr",                    { fg = custom.lineNr })

end

ColorMyPencils()
