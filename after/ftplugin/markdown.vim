setlocal ts=4 sts=4 sw=4 et
setlocal nonumber
set conceallevel=0

if !empty(globpath(&rtp, 'plugin/mkdp.vim'))
  nnoremap <buffer> <C-x><C-r> :MarkdownPreview<CR>
endif
