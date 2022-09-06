-- " NerdTree stuff
-- autocmd StdinReadPre * let s:std_in=1
-- autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
-- autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
-- autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

vim.api.nvim_exec([[ autocmd StdinReadPre * let s:std_in=1 ]], false)
vim.api.nvim_exec([[ autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif ]], false)
vim.api.nvim_exec([[ autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif ]], false)
vim.api.nvim_exec([[ autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif ]], false)

-- " NerdTree Git Plugin Stuff
vim.g.NERDTreeGitStatusIndicatorMapCustom = {
    Modified = "✹",
    Staged = "✚",
    Untracked = "✭",
    Renamed = "➜",
    Unmerged = "═",
    Deleted = "✖",
    Dirty = "✗",
    Clean = "✔︎",
    Ignored = '☒',
    Unknown = "?"
}

-- vim.api.nvim_exec([[
--     let g:NERDTreeGitStatusIndicatorMapCustom = {
--                 \ 'Modified'  :'✹',
--                 \ 'Staged'    :'✚',
--                 \ 'Untracked' :'✭',
--                 \ 'Renamed'   :'➜',
--                 \ 'Unmerged'  :'═',
--                 \ 'Deleted'   :'✖',
--                 \ 'Dirty'     :'✗',
--                 \ 'Ignored'   :'☒',
--                 \ 'Clean'     :'✔︎',
--                 \ 'Unknown'   :'?',
--                 \ }
-- ]], false)
