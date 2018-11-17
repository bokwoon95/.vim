function gbla
  git blame $argv | nvim - +'set nonu' +'set ls=1' +'nnoremap q :qa!<CR>' +'echo("[PRESS q TO QUIT]")'
end
