let whoami = "user1"

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
" Plug 'vim-python/python-syntax'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'psf/black'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" JavaScript stuff
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Linting
" Plug 'w0rp/ale'

" Autocomplete
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

" Syntax stuff
syntax enable

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
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" use json syntax highlighting for ptest files
autocmd BufNewFile,BufRead *.ptest set syntax=json
autocmd BufNewFile,BufRead *.py set syntax=imgqe_python

let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }

let g:semshi#error_sign = v:false


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

hi Normal ctermfg=252 ctermbg=NONE

autocmd BufWritePre *.py execute ':Black'

" Semshi custom highlighting
function MyCustomHighlights()
    hi semshiLocal           ctermfg=209 guifg=#ff875f
	hi semshiGlobal          ctermfg=214 guifg=#ffaf00
	hi semshiImported        ctermfg=30 guifg=#008787 cterm=bold gui=bold
	hi semshiParameter       ctermfg=75  guifg=#5fafff
	hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
	hi semshiFree            ctermfg=218 guifg=#ffafd7
	hi semshiBuiltin         ctermfg=171 guifg=#d75fff
	hi semshiAttribute       ctermfg=32 guifg=#0087d7
	hi semshiSelf            ctermfg=140 guifg=#a093c7
	hi semshiUnresolved      ctermfg=203 guifg=#e27878 cterm=underline gui=underline
	hi semshiSelected        ctermfg=195 ctermbg=30 guifg=#c6c8d1 guibg=#5b7881

endfunction

autocmd FileType python call MyCustomHighlights()

" Persistent undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
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

set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
