require('nvim-tree').setup({
    sort_by = ("case_sensitive"),
    view = {
	side = 'right'
    },
})

local Remap = require("brendonovich.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-b>", ":NvimTreeFocus<cr>")
nnoremap("<C-S-b>", ":NvimTreeToggle<cr>")
