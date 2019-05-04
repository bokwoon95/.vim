setlocal ts=4 sw=4 sts=4
" setlocal foldmethod=syntax
setlocal completeopt-=preview
setlocal foldlevel=20

nmap <C-c><C-t> <Plug>(go-info)
nmap <C-c><C-d> <Plug>(go-doc)
nmap <C-c><C-f> :GoFmt<CR>
nmap gd <Plug>(go-def)
nmap gdd <Plug>(go-def)
nmap gds <Plug>(go-def-split)
nmap gdv <Plug>(go-def-vertical)

inoremap <C-q><C-q> fmt.Println("")<Left><Left>
inoremap <C-q><C-w> fmt.Println()<Left>
inoremap <C-q><C-d> fmt.Printf("%#v\n",)<Left>
