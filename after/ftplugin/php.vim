setlocal ts=2 sw=2 sts=2 et
set formatoptions-=cro

command! PHPlint !php -l %

nnoremap K :Dash<CR>
xnoremap K "+y:Dash <C-r>+<CR>
nnoremap gK :Dash <cWORD><CR>
