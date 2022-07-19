vim.g.brendonovich_colorscheme = "onedark"

vim.g.onedark_termcolors=256
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")
vim.cmd("set termguicolors")
vim.cmd("colorscheme " .. vim.g.brendonovich_colorscheme)
