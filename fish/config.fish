abbr fconf "cd ~/.config/fish/; and pwd; and ls"
abbr vsnip "cd ~/.local/share/nvim/site/plugged/vim-snippets/snippets/; and pwd; and ls"
abbr updf "~/.vim/update.file.sh"

# python
abbr py "python3"
abbr pip "pip3"
abbr sv "./venv/bin/activate.fish"

# must-have shortcuts
abbr cdz "nvim ~/.config/fish/config.fish +'nnoremap q :qa!<CR>'"
abbr sdz "source ~/.config/fish/config.fish; or source ~/.config/fish/functions/*"
abbr .. "cd ..; and pwd; and ls"
abbr ... "cd ../..; and pwd; and ls"
abbr .... "cd ../../..; and pwd; and ls"
abbr lsa "ls -a -F"
abbr cp "cp -v"
abbr mv "mv -v"

# Git abbreviations
abbr gx "git status"
abbr gco "git commit"
abbr gca "git commit -a"
abbr gps "git push"
abbr gc "git checkout"
abbr gb "git branch"
abbr gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr gsv "git stash save"
abbr gsp "git stash pop"
abbr gsl "git stash list | nvim -M - +'set nonu' +'set ls=1' +'nnoremap q :qa!<CR>' +'echo(\"[PRESS q TO QUIT]\")'"
abbr grs "git reset --soft HEAD~1" #soft git commit rollback
abbr gdif "git diff | nvim -M - +'set nonu' +'set ls=1' +'nnoremap q :qa!<CR>' +'echo(\"[PRESS q TO QUIT]\")'"

# tmux abbreviations
abbr tx tmux -u new -s
abbr txx "tmux -u"
abbr txk "tmux -u -L kitty"
abbr tls "tmux ls"
abbr tax "tmux -u attach-session -t"
abbr tks "tmux kill-session -t"
abbr tka "tmux kill-server"
#tmux new -s Alice -t Bob will create a new session Alice that piggybacks existing session Bob

# Homebrew shortcuts
abbr bx "brew upgrade; and brew cleanup"
abbr bls="brew list"
abbr blv="brew leaves"

# if rmtrash utility is installed
abbr rmt "rmtrash"

# macOS is dumb
abbr xqattr "find . -iname '*.mp4' -print0 | xargs -0 xattr -d com.apple.quarantine"

# path abbreviations
abbr box "cd ~/Box\ Sync/; and pwd; and ls"
abbr dbox "cd ~/Dropbox/; and pwd; and ls"
abbr mega "cd ~/MEGA/; and pwd; and ls"
abbr doc "cd ~/Documents/; and pwd; and ls"
abbr desk "cd ~/Desktop/; and pwd; and ls"
abbr down "cd ~/Downloads/; and pwd; and ls"
abbr vol "cd /Volumes/; and pwd; and ls"
abbr trash "cd ~/.Trash/; and pwd; and ls"

# postgres abbreviations
abbr pgstart "pg_ctl -D /usr/local/var/postgres start"
abbr pgstop "pg_ctl -D /usr/local/var/postgres stop"

# abbreviate vim to nvim
abbr vim nvim
abbr vvim vim

# unison file sync
abbr unisonls "ls ~/Library/Application\ Support/Unison/*.prf | xargs -n 1 basename | grep -i -e '\\.prf'"
abbr unisonedit "nvim ~/Library/Application\ Support/Unison/*.prf"
abbr etop "hdiutil unmount /Volumes/TOP\ CAKES/"
