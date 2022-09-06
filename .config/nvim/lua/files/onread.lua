-- autocmd BufNewFile,BufRead *.py set syntax=python
vim.api.nvim_exec([[ autocmd BufNewFile,BufRead *.py set syntax=python ]], false)

-- autocmd BufNewFile,BufRead *.ptest set syntax=javascript
vim.api.nvim_exec([[ autocmd BufNewFile,BufRead *.ptest set syntax=javascript ]], false)
