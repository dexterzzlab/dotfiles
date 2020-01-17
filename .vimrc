" Plugin settings
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" NerdTree stuff
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Python stuff
Plug 'vim-python/python-syntax'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'Vimjas/vim-python-pep8-indent'

" Autocomplete
" Plug 'dense-analysis/ale'
" Plug 'davidhalter/jedi'
" Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy search
" Plug '/usr/local/opt/fzf'

" Theme
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'

call plug#end()" Basic settings

" Basic settings
set number
set tabstop=4
set shiftwidth=4
set autoindent
set relativenumber
set clipboard=unnamedplus
set nocompatible
set wrap!

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Theme
colorscheme iceberg
" set background=dark

" Syntax stuff
syntax enable
syntax on

" NerdTree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" NerdTree Git Plugin Stuff
let g:NERDTreeIndicatorMapCustom = {
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
autocmd BufWritePre * %s/\s\+$//e
autocmd BufNewFile,BufRead *.ptest set syntax=json


let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:python_highlight_all = 1

hi Normal ctermfg=252 ctermbg=NONE
