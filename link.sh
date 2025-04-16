#!/bin/bash

# Path to your dotfiles repo
DOTFILES=~/dotfiles

# Symlink dotfiles to home directory
ln -sf $DOTFILES/.bashrc ~/.bashrc
ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/.vimrc ~/.vimrc

# Symlink Neovim config directories
mkdir -p ~/.config
mkdir -p ~/.local/share

ln -sfn $DOTFILES/.config/nvim ~/.config/nvim
ln -sfn $DOTFILES/.local/share/nvim ~/.local/share/nvim

echo "Symlinks created!"

