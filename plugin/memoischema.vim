if !exists('g:memoischema_file')
  let g:memoischema_file=$HOME."/.vim/memoischema"
endif

if filereadable(g:memoischema_file)
  exec "source ".g:memoischema_file
end

function! s:memoischema_content()
  return ['colorscheme ' . g:colors_name, 'set background=' . &background]
endfunction

function! SaveMemoischema()
  call writefile(s:memoischema_content(), g:memoischema_file)
endfunction

autocmd ColorScheme * call SaveMemoischema()

if exists('g:memoischema_toggle_chars')
  for s:char in g:memoischema_toggle_chars
    exec 'nnoremap '.s:char.' :let &bg=(&bg==''light''?''dark'':''light'')<CR>call SaveMemoischema()<CR>'
  endfor
endif
