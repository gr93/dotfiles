#!/bin/bash

# Path to your dotfiles repo
DOTFILES=~/dev/dotfiles

# Symlink dotfiles to home directory
ln -sf $DOTFILES/.bashrc ~/.bashrc
ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/.vimrc ~/.vimrc
ln -sf $DOTFILES/.inputrc ~/.inputrc
ln -sf $DOTFILES/ampcs.sh ~/ampcs.sh

# Remove existing Neovim config if it exists (file, dir, or symlink)
[ -e "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
[ -e "$HOME/.local/share/nvim" ] && rm -rf "$HOME/.local/share/nvim"

# Recreate necessary parent directories (but not the actual nvim dir)
mkdir -p ~/.config
mkdir -p ~/.local/share

# Create symlink
ln -sfn "$DOTFILES/.config/nvim" "$HOME/.config/nvim"

echo "Symlinks created!"

