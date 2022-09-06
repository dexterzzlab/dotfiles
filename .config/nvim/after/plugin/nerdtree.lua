vim.api.nvim_create_autocmd("StdinReadPre", { command = [[ let s:std_in=1 ]] })
vim.api.nvim_create_autocmd(
	"VimEnter",
	{ command = [[ if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif ]] }
)
vim.api.nvim_create_autocmd(
	"VimEnter",
	{
		command = [[ if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif ]],
	}
)
vim.api.nvim_create_autocmd(
	"BufEnter",
	{ command = [[ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif ]] }
)

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
	Ignored = "☒",
	Unknown = "?",
}
