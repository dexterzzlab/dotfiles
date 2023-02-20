local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Space>tf", builtin.find_files, {})
vim.keymap.set("n", "<Space>tF", builtin.live_grep, {})
