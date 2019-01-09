setlocal ts=4 sw=4 sts=4 noet
setlocal formatoptions-=cro
if !has("gui_running")
  setlocal colorcolumn=80
endif

inoremap <buffer> <C-q><C-q> printf();<Left><Left>
inoremap <buffer> <C-q><C-a> int main(int argc, char *argv[]){<CR>}<Up><End><CR>
