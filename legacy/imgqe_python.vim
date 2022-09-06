" Vim syntax file
" Language:	Python and JavaScript
" Maintainer:	Dexter Tan

let b:current_syntax = ''
unlet b:current_syntax
runtime! syntax/python.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @Python syntax/python.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @JavaScript syntax/javascript.vim
syntax region pythonCode matchgroup=Snip start="= \"\"\"" end="\"\"\"" containedin=@Python contains=@JavaScript
syntax region pythonCode matchgroup=Snip2 start="Locator(\"\"\"" end="\"\"\"" containedin=@Python contains=@JavaScript
syntax region pythonCode matchgroup=Snip3 start="(\n *\"\"\""  end="\"\"\"" containedin=@Python contains=@JavaScript

hi link Snip SpecialComment
hi link Snip2 SpecialComment2
hi link Snip3 SpecialComment3

let b:current_syntax = ''
unlet b:current_syntax
syntax include @Python syntax/python.vim
syntax region pythonCode matchgroup=Snip4 start="= f\"\"\"" end="\"\"\"" containedin=@Python contains=@Python

hi link Snip4 SpecialComment4

let b:current_syntax = 'imgqe_python'
