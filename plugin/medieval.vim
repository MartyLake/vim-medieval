if get(g:, 'loaded_medieval')
    finish
endif
let g:loaded_medieval = 1

command! -bang -range -nargs=? EvalBlock
            \ if <range> > 0 |
            \   call medieval#evalrange(<line1>, <line2>, <bang>0 ? 'self' : <q-args>) |
            \ elseif <bang>0 |
            \   call medieval#eval('self') |
            \ else |
            \   call medieval#eval(<q-args>) |
            \ endif

nnoremap <silent> <Plug>(medieval-eval) :<C-U>call medieval#eval()<CR>
