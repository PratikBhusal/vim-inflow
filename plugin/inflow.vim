" Define the default global formatrpg value at startup.
if &formatprg ==# "" && executable("inflow")
    let s:my_textwidth = get(g:, 'inflow_default_width', &textwidth)

    if s:my_textwidth <= 0
        s:my_textwidth = 80
    endif

    " BUG: If a particular filetype should have a different width than the
    " default, the inflow param will not update to match the particular
    " filetype.
    "
    " Eg: Default width is 80. If java should have a default width of 120
    " characters, the formatprg will not change to 120 for the java buffer.
    "
    " TODO: Convert this into an autocmd that triggers on the FileType group
    execute printf("set formatprg=inflow\\ %d", s:my_textwidth)
endif

