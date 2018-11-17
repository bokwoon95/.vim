function gdi
#  if test (count $argv) -eq 0
#    echo "please input a git file to diff"
#  else
#    git diff $argv | nvim -M - +'set nonu' +'set ls=1' +'nnoremap q :qa!<CR>' +'echo("[PRESS q TO QUIT]")'
#  end
  git difftool $argv
end
