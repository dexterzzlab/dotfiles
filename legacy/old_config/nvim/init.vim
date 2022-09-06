" source ~/dotfiles/.vimrc

" Basic settings
set exrc
set number
set relativenumber
set nohlsearch
set expandtab
set tabstop=4
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

autocmd BufNewFile,BufRead *.py set syntax=python
autocmd BufNewFile,BufRead *.ptest set syntax=javascript


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


call plug#begin('~/.nvim/plugged')


	" Make sure you use single quotes
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'

	" NerdTree stuff
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Colorscheme
	Plug 'EdenEast/nightfox.nvim'

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
	Plug 'onsails/lspkind-nvim'

	" For vsnip users.
	" Plug 'hrsh7th/cmp-vsnip'
	" Plug 'hrsh7th/vim-vsnip'

	" For luasnip users.
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'

	" For ultisnips users.
	" Plug 'SirVer/ultisnips'
	" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

	" For snippy users.
	" Plug 'dcampos/nvim-snippy'
	" Plug 'dcampos/cmp-snippy'
	" Plug 'ray-x/lsp_signature.nvim'

call plug#end()

colorscheme nightfox


nnoremap <Space>d :lua vim.lsp.buf.definition()<CR>
nnoremap <Space>c :lua vim.lsp.buf.rename()<CR>
nnoremap <Space>r :lua vim.lsp.buf.references()<CR>
nnoremap <Space>a :lua vim.lsp.buf.code_action()<CR>
nnoremap <Space>n :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <Space>N :lua vim.lsp.diagnostic.goto_prev()<CR>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set completeopt=menu,menuone,noselect

" Normal mode remaps
" open a side terminal mode window
nnoremap <Space>; :vsplit \| terminal<CR>
nnoremap <Space>: :split \| terminal<CR>
" open splits
nnoremap <Space>v :vsplit<CR>
nnoremap <Space>h :split<CR>
" Open current window in tab
nnoremap <Space>t :tab sp<CR>
" Files fuzzy search
nnoremap <Space>f :Files<CR>
nnoremap <Space>F :Rg<CR>
" Isort
nnoremap <Space>i :Isort<CR>

" Terminal mode remaps
tnoremap <Esc> <C-\><C-n>

" hi Normal ctermfg=252 ctermbg=NONE
let g:black_linelength = 120
autocmd BufWritePre *.py execute ':Black'

" NerdTree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" NerdTree Git Plugin Stuff
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" removes trailing whitespace on save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()




