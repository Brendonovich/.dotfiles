require('telescope').setup()

local Remap = require("brendonovich.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope find_files<cr>")

require('telescope').load_extension 'file_browser'

nnoremap("<C-b>", ":Telescope file_browser<cr>")
