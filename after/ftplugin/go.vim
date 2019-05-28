setlocal ts=4 sw=4 sts=4
" setlocal foldmethod=syntax
setlocal completeopt-=preview
setlocal foldlevel=20
if executable('gofmt')
  setlocal equalprg=gofmt
endif

nmap <buffer> <C-c><C-t> <Plug>(go-info)
nmap <buffer> <C-c><C-d> <Plug>(go-doc)
nmap <buffer> <C-c><C-f> :GoFmt<CR>
nmap <buffer> gd <Plug>(go-def)
nmap <buffer> gdd <Plug>(go-def)
nmap <buffer> gds <Plug>(go-def-split)
nmap <buffer> gdv <Plug>(go-def-vertical)

inoremap <buffer> <C-q><C-q> fmt.Println("")<Left><Left>
inoremap <buffer> <C-q><C-w> fmt.Println()<Left>
inoremap <buffer> <C-q><C-d> fmt.Printf("%#v\n",)<Left>
