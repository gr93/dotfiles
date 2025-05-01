#!/bin/bash

# Path to your dotfiles repo
DOTFILES=~/dev/dotfiles

# Symlink dotfiles to home directory
ln -sf $DOTFILES/.bashrc ~/.bashrc
ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/.vimrc ~/.vimrc
ln -sf $DOTFILES/ampcs.sh ~/ampcs.sh

[ -f "~/.config/nvim" ] && rm -f ~/.config/nvim
[ -f "~/.local/share/nvim" ] && rm -f ~/.local/share/nvim

# Symlink Neovim config directories
mkdir -p ~/.config/nvim
mkdir -p ~/.local/share/nvim

ln -sfn $DOTFILES/.config/nvim ~/.config/nvim

echo "Symlinks created!"

