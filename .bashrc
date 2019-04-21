path-append() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}
path-prepend() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}
path-prepend ~/.config/composer/vendor/bin
path-prepend ~/.composer/vendor/bin
path-prepend ~/.local/bin
path-prepend /usr/local/opt/mysql@5.7/bin
path-prepend /usr/local/mysql/bin
path-prepend ~/pear/bin
path-prepend ~/.roswell/bin
path-append ~/go/bin
# Must-have shortcuts
# to expand an alias in zsh: C-x a
# to expand an alias in bash: C-M-e or <Esc> C-e
# to edit current line in $EDITOR (usu. vim): C-x C-e
alias cdz="vim ~/.bashrc +'nnoremap q :qa!<CR>'"
alias sdz="source ~/.bashrc"
alias ..="cd .. && pwd && ls"
alias ...="cd ../.. && pwd && ls"
alias ....="cd ../../.. && pwd && ls"
alias ls="ls -F"
alias lsa="ls -a -F"
alias lsl="ls -a -l -F"
cdd () {
  cd "$1" && pwd && ls;
}
mkcd () {
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}
alias checksize="du -h -d 1 | sort -n" #display file sizes
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

# virtualenv aliases
alias sv="source venv/bin/activate"

# Git aliases
alias  gac-Add-commit-and-push="git add . && git commit -v && git push origin master" #stage everything, create new commit and push in one step
alias  gak-Add-kommit-amend-and-push-force="git add . && git commit -v --amend --no-edit && git push -f origin master" #stage & commit everything into previous commit and force push in one step (DO NOT USE FOR SHARED REPOSITORIES)
alias  goc-commit-amend-and-push="git commit -v && git push origin master" #commit whatever's been staged into the previous commit and push in one step (DO NOT USE FOR SHARED REPOSITORIES)
alias  gok-kommit-amend-and-push-force="git commit -v --amend --no-edit && git push -f origin master" #commit whatever's been staged into the previous commit and force push in one step (DO NOT USE FOR SHARED REPOSITORIES)
alias gx="git status"
alias ga="git add"
alias ga.="git add ."
alias gap="git add -p"
gco () {
if [[ "$#" -eq 0 ]]; then
  git commit -v
else
  git commit -vm "$@"
fi
}
gca () {
if [[ "$#" -eq 0 ]]; then
  git add .; git commit -va
else
  git add .; git commit -vam "$@"
fi
}
alias gka="git add . && git commit -v --amend --no-edit"
alias gko="git commit -v --amend --no-edit"
alias gps="git push"
alias gc="git checkout"
alias gb="git branch"
alias gcb="git checkout -b"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --reflog"
alias gll="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gsp-slave-pull="git fetch --all && git reset --hard origin/master"
alias gsl="git stash list | vim - +'set nonu' +'set ls=1'"
alias grs="git reset --soft HEAD~1" #soft git commit rollback
alias gr.="git reset ."
alias gdiv="git diff | vim -M - +'set nonu' +'set ls=1' +'nnoremap q :qa!<CR>' +'echo(\"[PRESS q TO QUIT]\")'"
gdi () {
  if [[ "$#" -eq 0 ]]; then
    echo "please input a git file to diff"
  else
    git diff "$1" | vim -M - +'set nonu' +'set ls=1' +'nnoremap q :qa!<CR>' +'echo("[PRESS q TO QUIT]")'
  fi
}
gbla () {
  git blame "$@" | vim - +'set nu' +'set ls=1' +'nnoremap q :qa!<CR>' +'echo("[PRESS q TO QUIT]")'
}
alias gnv_open="vim \$(git status --porcelain | awk '{print \$2}')"
ghclone () {
  git clone https://github.com/$1 $2
}
ghclone-bw () {
  git clone https://github.com/bokwoon95/$1 $2
}
alias gcheckdangling="git fsck --unreachable --no-reflogs"
gprunedangling () {
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now
}
gdif () {
  if [[ -f ~/.vim/diff-highlight ]];then
    git diff --color "$@" | ~/.vim/diff-highlight | less
  else
    git diff --color "$@" | diff-highlight | less
  fi
}
gdifc () {
  if [[ -f ~/.vim/diff-highlight ]];then
    git diff --cached --color "$@" | ~/.vim/diff-highlight | less
  else
    git diff --cached --color "$@" | diff-highlight | less
  fi
}
gsho () {
  if [[ -f ~/.vim/diff-highlight ]];then
    git show --color "$@" | ~/.vim/diff-highlight | less
  else
    git show --color "$@" | diff-highlight | less
  fi
}
#git add --p(atch) <filename> to stage hunks

#tmux aliases
tax () {
if [[ "$#" -eq 0 ]]; then
  TERM=screen-256color-bce tmux -u new-session -A -s pi
else
  TERM=screen-256color-bce tmux -u new-session -A -s $1
fi
}
txm () {
if [[ "$#" -eq 0 ]]; then
  TERM=screen-256color-bce tmux -u new -t pi
else
  TERM=screen-256color-bce tmux -u new -s $1 -t pi
fi
}
alias tls="tmux ls"
alias tks="tmux kill-session -t"
alias tka="tmux kill-server"

dumpIpForInterface() {
  IT=$(ifconfig "$1")
  if [[ "$IT" != *"status: active"* ]]; then
    return
  fi
  if [[ "$IT" != *" broadcast "* ]]; then
    return
  fi
  echo "$IT" | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'
}
ipmain() {
  # snagged from here: https://superuser.com/a/627581/38941
  DEFAULT_ROUTE=$(route -n get 0.0.0.0 2>/dev/null | awk '/interface: / {print $2}')
  if [ -n "$DEFAULT_ROUTE" ]; then
    dumpIpForInterface "$DEFAULT_ROUTE"
  elif [[ $(uname) != 'Darwin' ]]; then # macOS ifconfig has no '-s' flag
    for i in $(ifconfig -s | awk '{print $1}' | awk '{if(NR>1)print}')
    do
      if [[ $i != *"vboxnet"* ]]; then
        dumpIpForInterface "$i"
      fi
    done
  fi
}
# Needed for git prompt variable $__git_ps1
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ] && . /usr/local/etc/bash_completion.d/git-prompt.sh
if [[ $(uname) = 'Darwin' ]]; then
  # export MYIP=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')
  export MYIP=$(ipmain)
else
  # export MYIP=$(ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | tail -1 | cut -d: -f2 | awk '{ print $1}')
  export MYIP=$(ifconfig | grep "inet 192.168" | tail -1 | sed -n "s|^\s*inet \(192.168[0-9\.]\+\).*|\1|p")
fi
if [[ "$MYIP" == "" ]]; then
  export PS1="\H \w$(__git_ps1)"
else
  export PS1="$MYIP \H \w$(__git_ps1)"
fi
PS1="$PS1"'\n'"\u$ "
# PS1="$PS1"$'\n'"\u$ "
# export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1) \[\033[00m\]\$ '

# For fixing the stupid raspberry pi locale issues
# sudo locale-gen
# sudo dpkg-reconfigure locales

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
