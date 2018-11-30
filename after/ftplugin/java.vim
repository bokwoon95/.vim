setlocal ts=4 sw=4 sts=4 et
if !has("gui_running")
  setlocal colorcolumn=120
endif

inoremap <buffer> <C-q><C-q> System.out.println();<Left><Left>
inoremap <buffer> <C-q><C-w> System.out.println()<Left>
inoremap <buffer> <C-q><C-a> public static void main(String[] args){<CR>}<Up><End><CR>
