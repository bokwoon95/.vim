setlocal ts=2 sw=2 sts=2 et

if executable('prettier')
  nnoremap <buffer> <C-c><C-f> :!prettier --write --print-width 120 %<CR>
endif
