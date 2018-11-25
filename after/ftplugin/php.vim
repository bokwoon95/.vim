setlocal ts=2 sw=2 sts=2 et
setlocal formatoptions-=cro

command! PHPlint !php -l %

nnoremap <buffer> K :Dash<CR>
xnoremap <buffer> K "+y:Dash <C-r>+<CR>
nnoremap <buffer> gK :Dash <cWORD><CR>

" Vdebug
nnoremap <buffer> <C-c><C-b> m`:silent! Breakpoint<CR>``
nnoremap <buffer> <C-c><C-d><C-b> m`:silent! BreakpointRemove *<CR>``
