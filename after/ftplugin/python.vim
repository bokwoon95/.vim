setlocal ts=4 sw=4 sts=4 et

inoremap <buffer> <C-q><C-q> print()<Left>
if executable('black')
  nnoremap <buffer> <C-c><C-f> :!black %<CR>
endif
