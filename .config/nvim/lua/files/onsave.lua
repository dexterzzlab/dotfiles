-- " removes trailing whitespace on save
-- function! <SID>StripTrailingWhitespaces()
--     let l = line(".")
--     let c = col(".")
--     %s/\s\+$//e
--     call cursor(l, c)
-- endfun
-- autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

vim.api.nvim_exec([[
    function! <SID>StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
]], false)

