setlocal ts=2 sw=2 sts=2 et

if executable('prettier')
    nnoremap <buffer> <C-c><C-f> :!prettier --write %<CR>
endif

" nnoremap <buffer> K :Dash<CR>
" xnoremap <buffer> K "+y:Dash <C-r>+<CR>
" nnoremap <buffer> gK :Dash <cWORD><CR>
