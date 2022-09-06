" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath

" source ~/.vimrc

" Create symlinks to dotfiles
" Update vimrc to be split
" Update trailing whitespace cleaner to be better

" Plugin settings
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.nvim/plugged')

	" Make sure you use single quotes
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'

	" Colorscheme
	Plug 'EdenEast/nightfox.nvim'

	" These things are interesting to keep - look into alternatives?
	Plug 'jeetsukumaran/vim-pythonsense'
	Plug 'Vimjas/vim-python-pep8-indent'
	Plug 'psf/black', { 'branch': 'stable' }
	Plug 'fisadev/vim-isort'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'itchyny/lightline.vim'

	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

	" For vsnip users.
	Plug 'hrsh7th/cmp-vsnip'
	" Plug 'hrsh7th/vim-vsnip'
	" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
	Plug 'onsails/lspkind-nvim'

	" For luasnip users.
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'

	Plug 'ray-x/lsp_signature.nvim'
	Plug 'glepnir/lspsaga.nvim'
	Plug 'simrat39/symbols-outline.nvim'
	" Plug 'tjdevries/nlua.nvim'
	" Plug 'tjdevries/lsp_extensions.nvim'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'

	" Plug 'nvim-telescope/telescope.nvim'
	" undo tree
	" Plug 'mbbill/undotree'


call plug#end()

" highlight Normal guibg=none

" let g:tokyonight_style = "night"
colorscheme nightfox
lua << EOF
local nightfox = require('nightfox')

-- configure it
nightfox.setup(
	{
		fox = "nightfox", -- Which fox style should be applied
		transparent = false, -- Disable setting the background color
		alt_nc = false, -- Non current window bg to alt color see `hl-NormalNC`
		terminal_colors = true, -- Configure the colors used when opening :terminal
		styles = {
		comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
		functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
		keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
		strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
		variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
		},
		inverse = {
		match_paren = true, -- Enable/Disable inverse highlighting for match parens
		visual = false, -- Enable/Disable inverse highlighting for visual selection
		search = false, -- Enable/Disable inverse highlights for search highlights
		},
		colors = {}, -- Override default colors
		hlgroups = {}, -- Override highlight groups
	}
)
nightfox.load()
EOF

set completeopt=menu,menuone,noselect
nnoremap <Space>ca :Lspsaga code_action<CR>
nnoremap <Space>d :lua vim.lsp.buf.definition()<CR>
nnoremap <Space>n :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <Space>i :lua vim.lsp.buf.implementation()<CR>

" nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <leader>vll :call LspLocationList()<CR>

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require 'cmp'
  -- local luasnip = require 'luasnip'
  local saga = require 'lspsaga'
  saga.init_lsp_saga()

  -- local signature = require "lsp_signature"
  -- signature.setup()

  cfg = {
	  debug = false, -- set to true to enable debug logging
	  log_path = "debug_log_file_path", -- debug log path
	  verbose = false, -- show debug line number

	  bind = true, -- This is mandatory, otherwise border config won't get registered.
				   -- If you want to hook lspsaga or other signature handler, pls set to false
	  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
					 -- set to 0 if you DO NOT want any API comments be shown
					 -- This setting only take effect in insert mode, it does not affect signature help in normal
					 -- mode, 10 by default

	  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

	  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
	  -- will set to true when fully tested, set to false will use whichever side has more space
	  -- this setting will be helpful if you do not want the PUM and floating win overlap
	  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
	  hint_enable = true, -- virtual hint enable
	  hint_prefix = "🐼 ",  -- Panda for parameter
	  hint_scheme = "String",
	  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
	  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
	  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
					   -- to view the hiding contents
	  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	  transpancy = 10, -- set this value if you want the floating windows to be transpant (100 fully transpant), nil to disable(default)
	  handler_opts = {
		border = "rounded"   -- double, rounded, single, shadow, none
	  },

	  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

	  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
	  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

	  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

	  transpancy = nil, -- disabled by default, allow floating win transparent value 1~100
	  shadow_blend = 36, -- if you using shadow as border use this set the opacity
	  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
	  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
	  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
	}

	-- recommanded:
	require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

	-- You can also do this inside lsp on_attach
	-- note: on_attach deprecated
	--require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
	  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	  ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
	  { name = 'buffer' },

    }, {
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline(':', {
    -- sources = cmp.config.sources({
      -- { name = 'path' }
    -- }, {
      -- { name = 'cmdline' }
    -- })
  -- })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig').pyright.setup {
    capabilities = capabilities
  }
EOF

" Basic settings
set exrc
set number
set relativenumber
set nohlsearch
" set hidden
" set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set autoindent
set clipboard=unnamedplus
set nowrap
set background=dark
set ignorecase
set smartcase
set noswapfile
set nobackup
" set undodir=~/.vim/undodir
" set undofile
set incsearch
" set scrolloff=8
set signcolumn=yes
set nocompatible

syntax enable

" set completeopt=menuone,noinsert,noselect
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" lua require'lspconfig'.pyright.setup{on_attach=require'nvim-cmp'.on_attach}

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead *.py set syntax=python

" Persistent undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.nvim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

let g:lightline = {'colorscheme': 'nightfox'}

set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set colorcolumn=120

set splitright
set splitbelow
