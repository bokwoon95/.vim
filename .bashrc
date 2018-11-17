# Must-have shortcuts
# to expand an alias in zsh: C-x a
# to expand an alias in bash: C-M-e or <Esc> C-e
# to edit current line in $EDITOR (usu. vim): C-x C-e
alias cdz="vim ~/.bashrc +'nnoremap q :qa!<CR>'"
alias sdz="source ~/.bashrc"
alias ..="cd .. && pwd && ls"
alias ...="cd ../.. && pwd && ls"
alias ....="cd ../../.. && pwd && ls"
cdd () {
  cd "$1" && pwd && ls;
}
mkcd () {
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}
alias checksize="du -h -d 1 | sort -n" #display file sizes
alias lsa="ls -a -F"
alias lsal="ls -a -l -F"
alias cp="cp -v"
alias mv="mv -v"
testt () {
  result=$(test "$@"; echo $?)
  if [ $result == 0 ]; then
    echo True
  else
    echo False
  fi
}
