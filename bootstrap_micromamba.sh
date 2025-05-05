#!/bin/bash

set -euo pipefail

# Set where micromamba should live
export MAMBA_ROOT_PREFIX="$HOME/micromamba"
MICROMAMBA_BIN="$MAMBA_ROOT_PREFIX/bin/micromamba"

# Install micromamba if it's not present
if [ ! -f "$MICROMAMBA_BIN" ]; then
    echo "Installing micromamba..."
    # "${SHELL}" <(curl -Ls https://micro.mamba.pm/install.sh)
    curl -Ls https://micro.mamba.pm/install.sh | bash
else
    echo "Micromamba already installed."
fi

# Set up micromamba shell integration
eval "$("$MICROMAMBA_BIN" shell hook -s posix)"

# Create or update the "tools" environment
echo "Creating/updating 'tools' environment..."
micromamba create -y -n tools lazygit bat ripgrep fzf zoxide neovim htop

echo "Done! Activate it with: micromamba activate tools"

