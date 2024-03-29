-- Bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

require('packer').startup(function()
  use('wbthomason/packer.nvim')

  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-file-browser.nvim')

  use('neovim/nvim-lspconfig')
  use('williamboman/nvim-lsp-installer')
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("L3MON4D3/LuaSnip")
  use("glepnir/lspsaga.nvim")

  use('github/copilot.vim')

  use('simrat39/rust-tools.nvim')

  use('kyazdani42/nvim-web-devicons')
  use('kyazdani42/nvim-tree.lua', {
    requires = { 'kyazdani42/nvim-web-devicons' },
  })
  use('voldikss/vim-floaterm')
  use('kdheepak/lazygit.nvim')
  use('numToStr/Comment.nvim', {
    config = function() require('Comment').setup() end
  })
  use('kevinhwang91/promise-async')
  use('kevinhwang91/nvim-ufo', {
    requires = { 'kevinhwang91/promise-async' }
  })
  use('nvim-lualine/lualine.nvim', {
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })

  use('ii14/onedark.nvim')

  use('nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate'
  })

  use('windwp/nvim-autopairs', {
    config = function() require('nvim-autopairs').setup() end
  })
  use('andweeb/presence.nvim')

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('Comment').setup()
