vim.cmd([[ autocmd StdinReadPre * let s:std_in=1 ]])
vim.cmd([[ autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif ]])
vim.cmd([[ autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif ]])
vim.cmd([[ autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif ]])

vim.g.NERDTreeShowHidden = 1

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
