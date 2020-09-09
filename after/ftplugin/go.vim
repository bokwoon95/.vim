setlocal ts=4 sw=4 sts=4
" setlocal foldmethod=syntax
setlocal completeopt-=preview
setlocal foldlevel=20

nmap <buffer> <C-c><C-t> <Plug>(go-info)
nmap <buffer> <C-c><C-d> <Plug>(go-doc)
if !empty(globpath(&rtp, 'plugin/ale.vim'))
  nmap <buffer> <C-c><C-f> :GoFmt<CR>:ALEDisable<CR>:ALEEnable<CR>
else
  nmap <buffer> <C-c><C-f> :GoFmt<CR>
endif
nmap <buffer> gd <Plug>(go-def)
nmap <buffer> gdd <Plug>(go-def)
nmap <buffer> gds <Plug>(go-def-split)
nmap <buffer> gdv <Plug>(go-def-vertical)
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')

inoremap <buffer> <C-q><C-q> w http.ResponseWriter, r *http.Request
inoremap <buffer> <C-q><C-s> skylb.TraceRequest(r)\\\\r = r.WithContext(skylb.SetRoleSectionCtx(w, r, RolePreserve, SectionPreserve))\\\\type Data struct {\\\\}\\\\var data Data\\\\skylb.Render(w, r, data, template.FuncMap{}, "")
