setlocal ts=2 sw=2 sts=2 et
setlocal formatoptions-=cro
if !has("gui_running")
  setlocal colorcolumn=120
endif

inoremap <buffer> <C-q><C-q> console.log();<Left><Left>
if executable('prettier')
    nnoremap <buffer> <C-c><C-f> :!prettier --write %<CR>
endif
if executable('standard') 
  nnoremap <buffer> <C-c><C-c><C-f> :!standard --fix %<CR>
endif

nnoremap <buffer> gO :silent !open <cfile><CR>
" nnoremap <buffer> K :Dash<CR>
" xnoremap <buffer> K "+y:Dash <C-r>+<CR>
" nnoremap <buffer> gK :Dash <cWORD><CR>
" Remap keys for gotos
nmap <buffer> <silent> <C-]> <Plug>(coc-definition)
nmap <buffer> <silent> gd <Plug>(coc-definition)
nmap <buffer> <silent> gy <Plug>(coc-type-definition)
nmap <buffer> <silent> gi <Plug>(coc-implementation)
nmap <buffer> <silent> gr <Plug>(coc-references)
" <Plug>(coc-diagnostic-info)
" <Plug>(coc-diagnostic-next)
" <Plug>(coc-diagnostic-prev)
" <Plug>(coc-definition)
" <Plug>(coc-declaration)
" <Plug>(coc-implementation)
" <Plug>(coc-type-definition)
" <Plug>(coc-references)
" <Plug>(coc-format-selected)
" <Plug>(coc-format)
" <Plug>(coc-rename)
" <Plug>(coc-codeaction)
" <Plug>(coc-codeaction-selected)
" <Plug>(coc-openlink)
" <Plug>(coc-fix-current)
" <Plug>(coc-float-hide)
" <Plug>(coc-float-jump)

inoremap <buffer> <C-M-y> ```javascript<CR><C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR><CR>```<Esc>g^k<C-v>?```<CR>jI00\|<Esc><C-v>/```<CR>klg<C-a>gvo:s/<C-v><Tab>/  /g<CR>gv<Esc>V/```<CR>
