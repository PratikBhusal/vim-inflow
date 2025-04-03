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
let g:inflow_on = '1.0.0.1'
let s:keepcpo = &cpoptions
set cpoptions&vim
" Plugin Guard }}}

augroup inflow
    autocmd!
    autocmd FileType * call inflow#setlocal_formatprg()
augroup END

" End Plugin Guard {{{ ---------------------------------------------------------
let &cpoptions = s:keepcpo
unlet s:keepcpo
" End Plugin Guard }}} ---------------------------------------------------------

" vim: set expandtab softtabstop=4 shiftwidth=4 foldmethod=marker:
