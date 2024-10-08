require("telescope").load_extension "file_browser"
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
-- Alternatively, using lua API
-- vim.keymap.set("n", "<leader>fb", function()
-- 	require("telescope").extensions.file_browser.file_browser()
-- end)
