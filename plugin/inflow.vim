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
let g:inflow_on = '1.2.0.0'
let s:keepcpo = &cpoptions
set cpoptions&vim
" Plugin Guard }}}

" See:
"
" - https://phelipetls.github.io/posts/code-formatting-vim/
function! s:safe_format(...) abort " {{{
    let w:view = winsaveview()

    " Need to use `normal!` to properly hit formatprg,
    " otherwise we would be in infinite loop.
    silent keepjumps normal! '[v']gq

    if v:shell_error > 0
        silent undo
        if get(g:, 'inflow_safe_format_fallback_to_c_indent', 0)
            " Need to use `normal!` to properly hit gw,
            " otherwise we may be hitting non-default behavior
            silent keepjumps normal! '[v']gw
        else
            echohl ErrorMsg
            echomsg 'formatprg "' . &formatprg . '" exited with status ' . v:shell_error
            echohl None
        endif
    endif
    keepjumps call winrestview(w:view)
    unlet w:view
endfunction " }}}

function! s:setlocal_formatprg() abort " {{{
    " Cannot make chances when `nomodifiable`
    if !&modifiable
        return
    endif

    " If we already have an existing formatprg defined
    " for the file, use it instead of the generic inflow
    if get(split(&formatprg), 0, 'inflow') != 'inflow'
        return
    endif

    let b:my_textwidth = &textwidth

    if b:my_textwidth <= 0
        b:my_textwidth = get(g:, 'inflow_fallback_width', 80)
    endif

    " There may be a better way to set the `formatprg` value
    " that does not use printf, but I think it's fine for now.
    execute printf("setlocal formatprg=inflow\\ %d", b:my_textwidth)

    if get(g:, 'inflow_use_safe_formatprg', 0)
        nmap <silent> gq :setlocal operatorfunc=<SID>safe_format<CR>g@
        vmap <silent> gq :<C-U>setlocal operatorfunc=<SID>safe_format<CR>gvg@
    endif
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
