#!/bin/bash
# chmod +x update.file.sh

yes | cp -v -rf ~/.zshrc ~/.vim/
#yes | cp -v -rf ~/.tmux.conf ~/.vim/
yes | cp -v -rf ~/.tigrc ~/.vim/
yes | cp -v -rf ~/.config/nvim/init.vim ~/.vim/
yes | cp -v -rf ~/.config/alacritty/alacritty.yml ~/.vim/
yes | cp -v -rf ~/.config/kitty/kitty.conf ~/.vim/
#yes | cp -v -rf ~/.gitconfig ~/.vim/
echo ""
echo "FISH FILES"
echo "================================================================================"
yes | cp -v -rf ~/.config/fish ~/.vim/
echo "================================================================================"
