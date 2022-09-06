-- autocmd BufWritePre * :call StripTrailingWhitespaces()
-- require("stylua").format()
vim.api.nvim_create_autocmd("BufWritePre", { pattern = { "*.lua" }, command = [[:lua require("stylua").format()]] })
