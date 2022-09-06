-- How many undos
vim.opt.undolevels = 1000
-- number of lines to save for undo
vim.opt.undoreload = 10000

-- " Persistent undo
-- " Put plugins and dictionaries in this dir (also on Windows)

-- let vimDir = '$HOME/.nvim'
-- let &runtimepath.=','.vimDir

-- " Keep undo history across sessions by storing it in a file
-- if has('persistent_undo')
--     let myUndoDir = expand(vimDir . '/undodir')
--     " Create dirs
--     call system('mkdir ' . vimDir)
--     call system('mkdir ' . myUndoDir)
--     let &undodir = myUndoDir
--     set undofile
-- endif
vim.opt.undofile = true
