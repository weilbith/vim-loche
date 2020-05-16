function! loche#utils#is_unamed_buffer(buffer_number) abort
  let l:buffer_name = expand('#' . a:buffer_number)
  return  strlen(l:buffer_name) <= 0
endfunction

function! loche#utils#location_list_is_empty() abort
  let l:location_list = getloclist(0)
  return len(l:location_list) <= 0
endfunction

function! loche#utils#purge_location_list() abort
  silent! lclose
  silent! call setloclist(0, [], 'r')
endfunction

function! loche#utils#possibly_reopen_location_window(buffer_number) abort
  if s:should_reopen_location_window(a:buffer_number)
    lopen
    wincmd p
  endif
endfunction

function! s:should_reopen_location_window(buffer_number) abort
  let l:cached_data = loche#cache#get_cached_data(a:buffer_number)
  let l:open_setting = get(g:, 'loche_reopen_behavior', 0)

  if l:open_setting == 0
    return l:cached_data['open']
  else
    return l:open_setting == 1
  endif
endfunction


