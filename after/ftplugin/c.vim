setlocal ts=4 sw=4 sts=4 noet
setlocal commentstring=//\ %s
setlocal formatoptions-=cro
if !has("gui_running")
  setlocal colorcolumn=80
endif
command! -nargs=+ -buffer Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
nnoremap <silent><buffer> K :Cppman <cword><CR>

inoremap <buffer> <C-q><C-q> printf("\n");<Left><Left><Left><Left><Left>
inoremap <buffer> <C-q><C-a> int main(int argc, char *argv[]){<CR>}<Up><End><CR>
