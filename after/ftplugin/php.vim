setlocal ts=2 sw=2 sts=2 et
set formatoptions-=cro

command! PHPlint !php -l %

nnoremap K :Dash<CR>
xnoremap K "+y:Dash <C-r>+<CR>
nnoremap gK :Dash <cWORD><CR>

" Vdebug
nnoremap <C-c><C-b> m`:silent! Breakpoint<CR>``
nnoremap <C-c><C-d><C-b> m`:silent! BreakpointRemove *<CR>``
