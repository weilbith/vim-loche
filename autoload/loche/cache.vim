let g:loche_cache_data = {}

function! loche#cache#save_location_list(buffer_number) abort
  let l:identifier = s:get_identifier_for_buffer(a:buffer_number)
  let l:data = s:build_cache_object(a:buffer_number)
  let g:loche_cache_data[l:identifier] = l:data
  return l:data
endfunction

function! loche#cache#buffer_has_cached_location_list(buffer_number) abort
  let l:identifier = s:get_identifier_for_buffer(a:buffer_number)
  return has_key(g:loche_cache_data, l:identifier)
endfunction

function! loche#cache#remove_buffer_location_list_from_cache(buffer_number) abort
  let l:identifier = s:get_identifier_for_buffer(a:buffer_number)
  unlet g:loche_cache_data[l:identifier]
endfunction

function! loche#cache#set_location_list_from_cache(buffer_number) abort
  let l:identifier = s:get_identifier_for_buffer(a:buffer_number)
  let l:data = loche#cache#get_cached_data(a:buffer_number)
  call setloclist(0, l:data['list'], 'r')
endfunction

function! loche#cache#get_cached_data(buffer_number) abort
  let l:identifier = s:get_identifier_for_buffer(a:buffer_number)
  return g:loche_cache_data[l:identifier]
endfunction

function! s:get_identifier_for_buffer(buffer_number) abort
  return expand('#' . a:buffer_number . ':p')
endfunction

function! s:build_cache_object(buffer_number) abort
  let l:location_list = getloclist(0)
  let l:location_window_open = s:is_location_window_open(a:buffer_number)
  return {'list': l:location_list, 'open': l:location_window_open}
endfunction

function! s:is_location_window_open(buffer_number) abort
  let l:location_window_id = getloclist(0, {'winid': 0})['winid']
  return l:location_window_id > 0
endfunction
