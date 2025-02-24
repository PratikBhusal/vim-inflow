function! inflow#setlocal_formatprg() " {{{
    let s:my_textwidth = &textwidth

    if s:my_textwidth <= 0
        s:my_textwidth = get(g:, 'inflow_default_width', 80)
    endif

    " There may be a better way to set the `formatprg` value
    " that does not use printf, but I think it's fine for now.
    execute printf("setlocal formatprg=inflow\\ %d", s:my_textwidth)
endfunction " }}}
