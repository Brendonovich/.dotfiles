require('telescope').setup()

vim.keymap.set('n', "<C-p>", ":Telescope find_files<cr><esc>")

require('telescope').load_extension 'file_browser'

vim.keymap.set('n', "<C-S-b>", ":Telescope file_browser<cr><esc>")
