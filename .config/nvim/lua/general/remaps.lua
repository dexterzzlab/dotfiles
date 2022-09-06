-- LSP
vim.api.nvim_set_keymap('n', '<Space>d', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>c', ':lua vim.lsp.buf.rename()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>r', ':lua vim.lsp.buf.references()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>a', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>n', ':lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>N', ':lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true })

-- Normal mode remaps
vim.api.nvim_set_keymap('n', '<Space>;', ':vsplit | terminal<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>:', ':split | terminal<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>v', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>h', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>t', ':tab sp<CR>', { noremap = true })

-- " Files fuzzy search
vim.api.nvim_set_keymap('n', '<Space>f', ':Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>F', ':Rg<CR>', { noremap = true })

-- " Isort
vim.api.nvim_set_keymap('n', '<Space>i', ':Isort<CR>', { noremap = true })

-- " Terminal mode remaps
-- vim.api.nvim_set_keymap('n', '<Esc>', '<C-\><C-n>', { noremap = true })

-- NERDTree remaps
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true })
