vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = { "*.py" }, command = [[set syntax=python]] })
vim.api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = { "*.ptest" }, command = [[set syntax=javascript]] }
)
