# ===== Basics
setopt no_beep # don't beep on error
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)

# ===== Changing Directories
setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt cdablevarS # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack

# ===== Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation

# ===== History
# setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
# setopt extended_history # save timestamp of command and duration
# setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
# setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
# setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
# setopt hist_ignore_space # remove command line from history list when first character on the line is a space
# setopt hist_find_no_dups # When searching history don't display results already cycled through twice
# setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
# setopt hist_verify # don't execute, just expand history
# setopt share_history # imports new commands and appends typed commands to history
# ZSH History 
alias history='fc -fl 1'
HISTFILE=~/.zsh_history
SAVEHIST=10000                              # Big history
HISTSIZE=10000                              # Big history
setopt EXTENDED_HISTORY                     # Include more information about when the command was executed, etc
setopt APPEND_HISTORY                       # Allow multiple terminal sessions to all append to one zsh command history
setopt HIST_FIND_NO_DUPS                    # When searching history don't display results already cycled through twice
setopt HIST_EXPIRE_DUPS_FIRST               # When duplicates are entered, get rid of the duplicates first when we hit $HISTSIZE 
setopt HIST_IGNORE_SPACE                    # Don't enter commands into history if they start with a space
setopt HIST_VERIFY                          # makes history substitution commands a bit nicer. I don't fully understand
setopt SHARE_HISTORY                        # Shares history across multiple zsh sessions, in real time
setopt HIST_IGNORE_DUPS                     # Do not write events to history that are duplicates of the immediately previous event
setopt INC_APPEND_HISTORY                   # Add commands to history as they are typed, don't wait until shell exit
setopt HIST_REDUCE_BLANKS                   # Remove extra blanks from each command line being added to history

# ===== Completion
# setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word # Allow completion from within a word/phrase

unsetopt menu_complete # do not autoselect the first completion entry
# bindkey '^[[Z' reverse-menu-complete

# ===== Correction
# setopt correct # spelling correction for commands
# setopt correctall # spelling correction for arguments

# ===== Prompt
setopt prompt_subst # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt # only show the rprompt on the current prompt

# ===== Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
# export LSCOLORS=Gxfxcxdxbxegedabagacad

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars --LONG-PROMPT --chop-long-lines --shift 4'
export PAGER='less'
# export EDITOR='subl -w'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey -e
bindkey "^K"      kill-line                            # ctrl-k
bindkey "^U"      backward-kill-line                   # ctrl-u
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b

# Completion
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
# setopt correctall
setopt MENU_COMPLETE

# Prompt
export PS1="%B%~%b"
# vcs
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
PS1="$PS1\$vcs_info_msg_0_"
# prompt-end
PS1="$PS1"$'\n'"%B$%b "

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

Check() {
  if [[ "$@" ]]
  then
    echo "True"
  else
    echo "False"
  fi
}

if [[ $(uname) = 'Darwin' ]]; then
  alias vim="nvim"
fi
if [[ $(uname) = 'Linux' ]]; then
  alias nvim="~/.local/bin/nvim"
  alias xo="xdg-open"
fi

alias etop="hdiutil unmount /Volumes/TOP\ CAKES/"
alias eall="osascript -e 'tell application \"Finder\" to eject (every disk whose ejectable is true)'"

# Sudo shit
# Defaults !tty_tickets
# Defaults timestamp_timeout=30
alias sunlock="sudo chmod -R 777 ."

# PATH setting
# path+=("~/.config/composer/vendor/bin")
# path=("~/.config/composer/vendor/bin" $path)
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
path-prepend ~/.local/bin
path-prepend /usr/local/mysql/bin
path-prepend ~/pear/bin
path-prepend ~/.roswell/bin
path-append ~/go/bin

# PostgreS
alias pg-erp-adms="pgcli postgres://admaterials:1qaz2wsx3edc@192.168.1.253:5433/adms -p 5436"
alias pgs-erp-adms="psql postgres://admaterials:1qaz2wsx3edc@192.168.1.253:5433/adms -p 5436"

# Golang
export GOPATH="$HOME/go"
alias goc="cdd ~/go/src/github.com/bokwoon95/"
alias gbin="cdd ~/go/bin/"

# Service aliases
if [[ $(uname) = 'Linux' ]]; then
  alias sx="sudo service"
  alias sxa="sudo service apache2"
  alias sxm="sudo service mysql"
elif [[ $(uname) = 'Darwin' ]]; then
  # alias sx="sudo service"
  alias sxa="sudo apachectl"
  alias sxm="sudo /usr/local/mysql/support-files/mysql.server"
fi

# Emacs better gui
if [[ $(uname) = 'Linux' ]]; then
  emacss() {
    emacs $@ &>/dev/null &
  }
  alias emx="emacss"
  alias emax="emacss"
fi
if [[ $(uname) = 'Darwin' ]]; then
  alias emacs="/usr/local/Cellar/emacs/*/bin/emacs"
fi

##############
# old config #
##############

export EDITOR='vim'
alias bx="brew upgrade && brew cleanup"

# Must-have shortcuts
# to expand an alias in zsh: C-x a
# to expand an alias in bash: C-M-e or <Esc> C-e
# to edit current line in $EDITOR (usu. vim): C-x C-e
alias cdz="vim ~/.zshrc +'nnoremap q :qa!<CR>'"
alias sdz="source ~/.zshrc"
alias ..="cd .. && pwd && ls"
alias ...="cd ../.. && pwd && ls"
alias ....="cd ../../.. && pwd && ls"
alias ls="ls -F "
cdd () {
  if [[ "$#" -eq 0 ]]; then
    cd && pwd && ls
  else
    cd "$1" && pwd && ls;
  fi
}
mkcd () {
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}
alias checksize="du -h -d 1 | sort -n" #display file sizes
mann () {
  if [ -z "$1" ]
  then
    echo "What manual page do you want?"
  else
    man $1 |
      # sed "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K|H]//g" |
      sed "s/.\//g" |
      vim -M - +'set nonu' +'set ls=1' +'nnoremap q :qa!<CR>'
  fi
}
alias lsa="ls -a -F"
alias lsl="ls -alF"
findvid () {
  find . -iname "*.mp4" -o -iname "*.mov" -o -iname "*.flv" -o -iname "*.mkv" -o -iname "*.TS"
}
findpic () {
  find . -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif"
}
alias cp="cp -v"
alias mv="mv -v"
unspace () {
  for f in "$@"; do
    mv "$f" "${f// /_}"
  done
}
respace () {
  for f in "$@"; do
    mv "$f" "${f//_/ }"
  done
}
testt () {
  result=$(test "$@"; echo $?)
  if [ $result == 0 ]; then
    echo True
  else
    echo False
  fi
}

# misc
alias updf="~/.vim/update.file.sh" #update dotfiles in .vim repo
alias py="python3"
alias pip="pip3"
krename () {
  kitty @ set-tab-title "$1";
}
alias rmt="rmtrash"

# youtube-dl aliases
youtube-dl3 () {
if [[ "$#" -eq 0 ]]; then
  echo "provide Youtube URL(s) to extract their mp3. Playlist URLs will have all their audio files inside extracted."
else
  for filename in "$@"; do
    youtube-dl -x --audio-format mp3 "$filename"
    # if [[ "${filename}" =~ .*www.youtube.com/watch?.* ]]; then
    #   youtube-dl -x --audio-format mp3 "$filename"
    # else
    #   echo "$filename is not a youtube link"
    # fi
  done
fi
}
youtube-dl4 () {
if [[ "$#" -eq 0 ]]; then
  echo "provide Youtube URL(s) to extract their mp4. Playlist URLs will have all their videos inside extracted."
else
  for filename in "$@"; do
    youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "$filename"
    # if [[ "${filename}" =~ .*www.youtube.com/watch?.* ]]; then
    #   youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "$filename"
    # else
    #   echo "================================================================================"
    #   echo "$filename is not a youtube link"
    #   echo "================================================================================"
    # fi
  done
fi
}
# Required for youtube-dl to work in zsh
setopt +o nomatch

# ffmpeg aliases
fftrim () { #3 arguments, input file, start time, duration
  if [[ "$#" -eq 0 ]]; then
    echo "HOW TO USE: fftrim takes in 3 arguments, input_file.mp3/.mp4, start_time, duration"
    echo "EXAMPLE: fftrim song.mp3 0 1:00     (trims song.mp3 from 0:00 onward, output duration will be 1 minute long"
    echo "EXAMPLE: fftrim video.mp4 0:30 1:00 (trims video.mp4 from 0:30 onward, output duration will be 1 minute long)"
  elif [ "$#" -ne 3 ]; then
    echo "NOTE: fftrim takes in only 3 arguments! input_file.mp3/.mp4, start_time, duration"
  else
    if [[ ${1: -4} == ".mp3" ]]; then
      ffmpeg -i "$1" -ss "$2" -t "$3" -acodec copy -vsync 2 "${1%.mp3}T.mp3";
    elif [[ ${1: -4} == ".mp4" ]]; then
      ffmpeg -i "$1" -ss "$2" -t "$3" -acodec copy -vsync 2 "${1%.mp4}T.mp4";
    else
      echo "file is not an mp3 or mp4!"
    fi
  fi
}
ffadeoutmp3 () { #input file, start of fade, duration of fade
  if [[ "$#" -eq 0 ]]; then
    echo "HOW TO USE: ffadeoutmp3 takes in 3 arguments, input_file.mp3, start_of_fade(only accepts minutes:seconds format), duration_of_fade(how long the fade should be stretched over, in seconds. Everything after the fade will be silenced)"
  elif [ "$#" -ne 3 ]; then
    echo "ffadeoutmp3 takes in only 3 arguments! input_file.mp3, start_of_fade, duration_of_fade"
  else
    minutes=${2%%:*}
    seconds=${2##*:}
    totalseconds=$(($minutes*60 + $seconds))
    echo "$minutes min $seconds sec= $totalseconds sec"
    if [[ ${1: -4} == ".mp3" ]]; then
      # :st= start of fade, :d= duration of fade
      ffmpeg -i "$1" -af "afade=t=out:st='$totalseconds':d='$3'" "${1%.mp3}F.mp3";
    else
      echo "file is not an mp3!"
    fi
  fi
}
ff-convert-to-mp4 () {
if [[ "$#" -eq 0 ]]; then
  echo "HOW TO USE: ff-convert-to-mp4 accepts only TS/flv/mov/avi/mkv/wmv files. It will convert all files provided as arguments that match the first file's filetype"
  echo "EXAMPLE: ff-convert-to-mp4 video1.flv                     (converts video.flv into video.mp4)"
  echo "EXAMPLE: ff-convert-to-mp4 *.flv                          (converts all flv files into mp4)"
  echo "EXAMPLE: ff-convert-to-mp4 video1.TS video2.TS video3.mov (ignores video3.mov because the first file is a .TS)"
elif [[ ${1: -4} == ".mov" ]]; then
  for filename in "$@"; do
    if [[ ${filename: -4} == ".mov" ]]; then
      echo "$filename"
      ffmpeg -i $filename -c copy "${filename%.mov}.mp4";
      echo "----------------------------------------"
    fi
  done
elif [[ ${1: -4} == ".flv" ]]; then
  for filename in "$@"; do
    if [[ ${filename: -4} == ".flv" ]]; then
      echo "$filename"
      ffmpeg -i $filename -codec copy "${filename%.flv}.mp4";
      echo "----------------------------------------"
    fi
  done
elif [[ ${1: -3} == ".TS" ]]; then
  for filename in "$@"; do
    if [[ ${filename: -3} == ".TS" ]]; then
      echo "$filename"
      ffmpeg -i $filename -acodec copy -vcodec copy "${filename%.TS}.mp4";
      echo "----------------------------------------"
    fi
  done
elif [[ ${1: -3} == ".ts" ]]; then
  for filename in "$@"; do
    if [[ ${filename: -3} == ".ts" ]]; then
      echo "$filename"
      ffmpeg -i $filename -acodec copy -vcodec copy "${filename%.ts}.mp4";
      echo "----------------------------------------"
    fi
  done
elif [[ ${1: -4} == ".avi" ]]; then
  for filename in "$@"; do
    if [[ ${filename: -4} == ".avi" ]]; then
      echo "$filename"
      ffmpeg -i $filename -c:a aac -b:a 128k -c:v libx264 -crf 23 "${filename%.avi}.mp4";
      echo "----------------------------------------"
    fi
  done
elif [[ ${1: -4} == ".mkv" ]]; then
  for filename in "$@"; do
    if [[ ${filename: -4} == ".mkv" ]]; then
      echo "$filename"
      ffmpeg -i $filename -codec copy  "${filename%.mkv}.mp4";
      echo "----------------------------------------"
    fi
  done
elif [[ ${1: -4} == ".wmv" ]]; then
  for filename in "$@"; do
    if [[ ${filename: -4} == ".wmv" ]]; then
      echo "$filename"
      ffmpeg -i $filename -c:v libx264 -crf 23 -c:a aac -strict -2 -q:a 100 "${filename%.wmv}.mp4";
      echo "----------------------------------------"
    fi
  done
else
  echo "first file is neither a TS, flv or mov file"
fi
}
ff-convert-to-mp3 () {
if [[ "$#" -eq 0 ]]; then
  echo "HOW TO USE: ff-convert-to-mp3 accepts only flac files. It will convert all files provided as arguments that match the first file's filetype"
elif [[ ${1: -5} == ".flac" ]]; then
  for filename in "$@"; do
    if [[ ${1: -5} == ".flac" ]]; then
      echo "$filename"
      ffmpeg -i $filename -ab 320k -map_metadata 0 -id3v2_version 3 "${filename%.flac}.mp3";
      echo "----------------------------------------"
    fi
  done
else
  echo "first file is not a flac file"
fi
}

# virtualenv aliases
alias sv="source venv/bin/activate"

# Git aliases
alias  gac-Add-commit-and-push="git add . && git commit && git push origin master" #stage everything, create new commit and push in one step
alias  gak-Add-kommit-amend-and-push-force="git add . && git commit --amend --no-edit && git push -f origin master" #stage & commit everything into previous commit and force push in one step (DO NOT USE FOR SHARED REPOSITORIES)
alias  gko-kommit-amend-and-push-force="git commit --amend --no-edit && git push -f origin master" #commit whatever's been staged into the previous commit and force push in one step (DO NOT USE FOR SHARED REPOSITORIES)
alias gx="git status"
alias gxx="git status -s"
alias ga="git add"
alias gco="git commit -m"
alias gca="git commit -am"
alias gps="git push"
alias gc="git checkout"
alias gb="git branch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glv="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit | vim - +'set nonu' +'set ls=0' +'nnoremap q :qa!<CR>' +'echo(\"[PRESS q TO QUIT]\")'"
alias gsv="git stash save"
alias gsp="git stash pop"
alias gsp-slave-pull="git fetch --all && git reset --hard origin/master"
alias gsl="git stash list | vim - +'set nonu' +'set ls=1'"
alias grs="git reset --soft HEAD~1" #soft git commit rollback
alias gdif="git diff | vim -M - +'set nonu' +'set ls=1' +'nnoremap q :qa!<CR>' +'echo(\"[PRESS q TO QUIT]\")'"
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
#git add --patch <filename> to stage hunks

#abduco aliases
alias abd="abduco"
alias abc="abduco -c"
alias aba="abduco -a"

#tmux aliases
tax () {
if [[ "$#" -eq 0 ]]; then
  TERM=screen-256color-bce tmux -u new-session -A -s main
else
  TERM=screen-256color-bce tmux -u new-session -A -s $1
fi
}
txm () {
if [[ "$#" -eq 0 ]]; then
  TERM=screen-256color-bce tmux -u new -t main
else
  TERM=screen-256color-bce tmux -u new -s $1 -t main
fi
}
alias tls="tmux ls"
alias tks="tmux kill-session -t"
alias tka="tmux kill-server"

#sshfs aliases
#https://blogs.harvard.edu/acts/2013/11/08/the-newbie-how-to-set-up-sshfs-on-mac-os-x/
#for more comprehensive guide on sshfs, check out http://gleek.github.io/blog/2017/04/11/editing-remote-code-with-emacs/
sshfx () { #not working for some reason
  if [[ "$#" -ne 2 ]]; then
    echo "usage format: sshfx username@remoteserver:/remote/directory/ ~/local/directory/"
    echo "              Mounts the /remote/directory/ onto the ~/local/directory/"
    echo "              umount ~/local/directory/ to unmount (that's 'umount', not 'unmount')"
  else
    sshfs -p 22 "$1" "$2" -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache
  fi
}

tel-resize() {
  if [[ $(pwd) != "$HOME/Desktop" ]]; then
    echo "Not in desktop"
    cd ~/Desktop
  fi
  # if [[ -f *.jpg || -f *.JPG || -f *.png || -f *.PNG ]]; then
  #   if [[ ! -f ~/Dropbox/resize.sh ]]; then
  #     echo "~/Dropbox/resize.sh not found"
  #     return
  #   fi
  #   cp ~/Dropbox/resize.sh ~/Desktop/resize.sh
  #   cd ~/Desktop/ && ~/Desktop/resize.sh
  #   mkdir -p ~/Desktop/v2 ~/Desktop/old
  #   mv ~/Desktop/*-v2.png ~/Desktop/v2
  #   mv ~/Desktop/*.png ~/Desktop/old
  #   mv ~/Desktop/*.PNG ~/Desktop/old
  #   mv ~/Desktop/*.jpg ~/Desktop/old
  #   mv ~/Desktop/*.JPG ~/Desktop/old
  #   mv ~/Desktop/v2/* ~/Desktop/
  #   rm -rf ~/Desktop/v2
  #   rm ~/Desktop/resize.sh
  # else
  #   echo "no images png/jpg found on desktop, no changes were made"
  # fi
  if [[ ! -f ~/Dropbox/resize.sh ]]; then
    echo "~/Dropbox/resize.sh not found"
    return
  fi
  cp ~/Dropbox/resize.sh ~/Desktop/resize.sh
  cd ~/Desktop/ && ~/Desktop/resize.sh
  mkdir -p ~/Desktop/v2 ~/Desktop/old
  mv ~/Desktop/*-v2.png ~/Desktop/v2
  mv ~/Desktop/*.png ~/Desktop/old
  mv ~/Desktop/*.PNG ~/Desktop/old
  mv ~/Desktop/*.jpg ~/Desktop/old
  mv ~/Desktop/*.JPG ~/Desktop/old
  mv ~/Desktop/v2/* ~/Desktop/
  rm -rf ~/Desktop/v2
  rm ~/Desktop/resize.sh
}

tclean() {
  if [[ $(pwd) != "$HOME/Desktop" ]]; then
    echo "Not in desktop"
    cd ~/Desktop
  fi
  rm -rf ~/Desktop/old
  rm ~/Desktop/*-v2.png
}

# dir aliases
alias box="cd ~/Box\ Sync/ && pwd && ls"
alias dbox="cd ~/Dropbox/ && pwd && ls"
alias mega="cd ~/MEGA/ && pwd && ls"
alias doc="cd ~/Documents/ && pwd && ls"
alias desk="cd ~/Desktop/ && pwd && ls"
alias down="cd ~/Downloads/ && pwd && ls"
alias vol="cd /Volumes/ && pwd && ls"
alias trash="cd ~/.Trash/ && pwd && ls"
#windows specific
alias whome="cd ~/whome/ && pwd && ls"
alias wdoc="cd ~/wdoc/ && pwd && ls"
alias wdesk="cd ~/wdesk/ && pwd && ls"
alias wdown="cd ~/wdown/ && pwd && ls"

# zsh-autosuggestions settings
# add plugins=(zsh-autosuggestions) under plugins=(git) (L54)
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=187' #white, incompatible with iceberg
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=106'
#fg=187 for solarized dark
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-word}")
# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-word)
bindkey '^ ' forward-word

# project aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neovim-remote
if [ -n "${NVIM_LISTEN_ADDRESS}" ]; then
  alias nvh='nvr -o'
  alias nvv='nvr -O'
  alias nv='nvr --remote'
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=106'
else
  alias nv="nvim"
fi

# fancy-ctrl-z
fancy-ctrl-z () {
if [[ $#BUFFER -eq 0 ]]; then
  BUFFER="fg"
  zle accept-line
else
  zle push-input
  zle clear-screen
fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# disable flow control
stty -ixon

#single <Tab> completion for bash (goes in .inputrc)
# set show-all-if-ambiguous on
# set completion-ignore-case on

# OPAM configuration
# . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
path-prepend /Users/$USER/.opam/default/bin
if [[ -d ~/.opam ]]; then
  eval `opam config env`
fi

if [[ -z "$TMUX" && ! -n "${NVIM_LISTEN_ADDRESS+x}" ]]; then
  TERM=screen-256color-bce tmux -u new-session -A -s main
fi
