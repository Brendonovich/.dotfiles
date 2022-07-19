local Remap = require("brendonovich.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope find_files<cr>")
