-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- General useful plugins
    use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-repeat'
	use 'tpope/vim-fugitive'

	-- NerdTree stuff
	use { 'scrooloose/nerdtree', requires = {'Xuyuanp/nerdtree-git-plugin'} }

	-- Colorscheme
    -- use { "catppuccin/nvim", as = "catppuccin" }
	use 'EdenEast/nightfox.nvim'
    use 'itchyny/lightline.vim'

    -- Python
	use 'jeetsukumaran/vim-pythonsense'
	use 'Vimjas/vim-python-pep8-indent'
    use { 'psf/black', branch = 'stable' }
	use 'fisadev/vim-isort'

    -- Fuzzy finder
    --	use { 'junegunn/fzf', run = function() vim.fn['fzf#install'] end }
    --	use 'junegunn/fzf.vim'

    -- LSP
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'onsails/lspkind-nvim'

    -- For luasnip users.
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
end)
