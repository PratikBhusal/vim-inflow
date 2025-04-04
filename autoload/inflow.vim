function! inflow#setlocal_formatprg() " {{{
    " If we already have an existing formatprg defined
    " for the file, use it instead of the generic inflow
    if get(split(&formatprg), 0, 'inflow') != 'inflow'
        return
    endif

    let s:my_textwidth = &textwidth

    if s:my_textwidth <= 0
        s:my_textwidth = get(g:, 'inflow_default_width', 79)
    endif

    " There may be a better way to set the `formatprg` value
    " that does not use printf, but I think it's fine for now.
    execute printf("setlocal formatprg=inflow\\ %d", s:my_textwidth)
endfunction " }}}
