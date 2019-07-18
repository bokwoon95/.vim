setlocal ts=2 sw=2 sts=2 et

nmap <buffer> <silent> <C-]> <Plug>(coc-definition)
nmap <buffer> <silent> gd <Plug>(coc-definition)
nmap <buffer> <silent> gy <Plug>(coc-type-definition)
nmap <buffer> <silent> gi <Plug>(coc-implementation)
nmap <buffer> <silent> gr <Plug>(coc-references)
nmap <buffer> <silent> <Leader>rn <Plug>(coc-rename)
