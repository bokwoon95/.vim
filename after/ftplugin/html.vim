setlocal ts=2 sw=2 sts=2 et

" if executable('prettier')
"   nnoremap <buffer> <C-c><C-f> :!prettier --write --print-width 120 %<CR>
" endif
if executable('tidy')
endif

" nnoremap <buffer> K :Dash<CR>
" xnoremap <buffer> K "+y:Dash <C-r>+<CR>
" nnoremap <buffer> gK :Dash <cWORD><CR>
