require('nvim-tree').setup({
  sort_by = ("case_sensitive"),
  view = {
    side = 'right'
  },
})

vim.keymap.set('n', "<C-b>", ":NvimTreeFocus<cr>")
vim.keymap.set('n', "<C-S-b>", ":NvimTreeToggle<cr>")
