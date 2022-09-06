-- autocmd BufWritePre *.py execute ':Black'
vim.api.nvim_exec([[ autocmd BufWritePre *.py execute ':Black' ]], false)
