setlocal ts=2 sw=2 sts=2 et
set formatoptions-=cro

inoremap <C-q><C-q> console.log();<Left><Left>

nnoremap gO :silent !open <cfile><CR>
nnoremap K :Dash<CR>
xnoremap K "+y:Dash <C-r>+<CR>
nnoremap gK :Dash <cWORD><CR>

inoremap <C-M-y> ```javascript<CR><C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR><CR>```<Esc>g^k<C-v>?```<CR>jI00\|<Esc><C-v>/```<CR>klg<C-a>gvo:s/<C-v><Tab>/  /g<CR>gv<Esc>V/```<CR>
