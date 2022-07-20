vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false 

vim.opt.wrap = false
vim.opt.updatetime = 50
vim.opt.relativenumber = true

-- Move lines up + down with Alt
vim.keymap.set('n', '∆', ':m +1<cr>')
vim.keymap.set('n', '˚', ':m -2<cr>')
vim.keymap.set('i', '∆', '<esc>:m +1<cr>==gi')
vim.keymap.set('i', '˚', '<esc>:m -2<cr>==gi')
vim.keymap.set('v', '∆', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', '˚', ":m '<-2<cr>gv=gv")

