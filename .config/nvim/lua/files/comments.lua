-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
vim.api.nvim_exec([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]], false)
