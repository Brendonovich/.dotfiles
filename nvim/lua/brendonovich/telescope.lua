require('telescope').setup()

vim.api.nvim_set_keymap(
    'n',
    '<space>ff',
    ':Telescope find_files',
    { noremap = true }
)

require('telescope').load_extension 'file_browser'

vim.api.nvim_set_keymap(
    'n',
    '<space>fb',
    ':Telescope file_browser',
    { noremap = true }
)
