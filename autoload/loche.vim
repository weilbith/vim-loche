let s:cached_location_lists = {}


function! loche#cache_location_list(buffer_number) abort
  if loche#utils#is_unamed_buffer(a:buffer_number) | return | endif
  if loche#utils#location_list_is_empty() | return | endif
  call loche#cache#save_location_list(a:buffer_number)
  call loche#utils#purge_location_list()
endfunction


function! loche#restore_location_list(buffer_number) abort
  if !loche#cache#buffer_has_cached_location_list(a:buffer_number) | return | endif
  call loche#cache#set_location_list_from_cache(a:buffer_number)
  call loche#utils#possibly_reopen_location_window(a:buffer_number)
  call loche#cache#remove_buffer_location_list_from_cache(a:buffer_number)
endfunction


function! loche#remove_cached_location_list(buffer_number) abort
  if !loche#cache#buffer_has_cached_location_list(a:buffer_number) | return | endif
  call loche#cache#remove_buffer_location_list_from_cache(a:buffer_number)
endfunction
