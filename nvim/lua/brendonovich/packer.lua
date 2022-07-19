-- Bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
    use('wbthomason/packer.nvim')

    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-file-browser.nvim')

    use('joshdick/onedark.vim')
    
    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    })

    use('neoclide/coc.nvim', {
	branch = 'release'
    })

    use('windwp/nvim-autopairs', {
	config = function() require('nvim-autopairs').setup {} end
    })
    
    if packer_bootstrap then
	require('packer').sync()
    end
end)
