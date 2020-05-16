if exists('g:loaded_loche')
  finish
endif

let g:loaded_loche = 1

if !get(g:, 'loche_disable_auto_cache', v:false)
  augroup Loche
    autocmd!
    autocmd BufWinLeave * call loche#cache_location_list(expand('<abuf>'))
    autocmd BufWinEnter * call loche#restore_location_list(expand('<abuf>'))
    autocmd BufDelete * call loche#remove_cached_location_list(expand('<abuf>'))
  augroup END
endif
