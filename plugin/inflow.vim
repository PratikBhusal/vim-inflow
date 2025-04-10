" Plugin Guard {{{
if (exists('g:inflow_on') && !g:inflow_on) ||
   \    &compatible ||
   \    !executable('inflow')

    let g:inflow_on = 0
    finish
endif
if exists('g:inflow_on')
    finish
endif
let g:inflow_on = '1.0.0.2'
let s:keepcpo = &cpoptions
set cpoptions&vim
" Plugin Guard }}}

function! s:setlocal_formatprg() " {{{
    " If we already have an existing formatprg defined
    " for the file, use it instead of the generic inflow
    if get(split(&formatprg), 0, 'inflow') != 'inflow'
        return
    endif

    let s:my_textwidth = &textwidth

    if s:my_textwidth <= 0
        s:my_textwidth = get(g:, 'inflow_default_width', 80)
    endif

    " There may be a better way to set the `formatprg` value
    " that does not use printf, but I think it's fine for now.
    execute printf("setlocal formatprg=inflow\\ %d", s:my_textwidth)
endfunction " }}}

augroup inflow
    autocmd!
    autocmd FileType * call <SID>setlocal_formatprg()
augroup END

" End Plugin Guard {{{ ---------------------------------------------------------
let &cpoptions = s:keepcpo
unlet s:keepcpo
" End Plugin Guard }}} ---------------------------------------------------------

" vim: set expandtab softtabstop=4 shiftwidth=4 foldmethod=marker:
