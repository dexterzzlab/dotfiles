vim.g.vim_isort_config_overrides = { line_length = 120 }
vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*.py", command = ":Isort" })
vim.g.black_linelength = 120
vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*.py", command = ":Black" })
